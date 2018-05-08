Similar to solving two dimensional rubiks cube (sort of)
NIce example of indirect addressing

Same results in WPS and SAS

github
https://github.com/rogerjdeangelis/utl_similar_to_solving_two_dimensional_rubiks_cube

see
https://stackoverflow.com/questions/50239385/find-frequency-of-an-element-in-a-matrix-in-r

HAVE
====

WORK.HAVE total obs=7

   V1    V2    V3    V4

    1     3     .     .
    1     3     2     .
    2     1     3     4
    4     2     .     .
    .     2     .     .
    4     2     .     .
    2     3     .     .

EXAMPLE OF OUTPUT

 WORK.WANT total obs=7

  RED    ORANGE    GREEN    BLUE

   1        .        3        .
   1        2        3        .
   1        2        3        4
   .        2        .        4
   .        2        .        .
   .        2        .        4
   .        2        3        .


PROCESS
========

data want;

  array inp[4] v1-v4;
  array out[4] red orange green blue;
  set have;
  do i=1 to 4;
   if inp[i] ne . then out[inp[i]]=inp[i];
  end;
  keep red orange green blue;

run;quit;


OUTPUT
======
 WORK.WANT total obs=7

  RED    ORANGE    GREEN    BLUE

   1        .        3        .
   1        2        3        .
   1        2        3        4
   .        2        .        4
   .        2        .        .
   .        2        .        4
   .        2        3        .

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data have;
  input v1 v2 v3 v4;
cards4;
 1 3 . .
 1 3 2 .
 2 1 3 4
 4 2 . .
 . 2 . .
 4 2 . .
 2 3 . .
;;;;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

see process for SAS solution

%utl_submit_wps64('
libname wrk sas7bdat "%sysfunc(pathname(work))";
data want;

  array inp[4] v1-v4;
  array out[4] red orange green blue;
  set wrk.have;
  do i=1 to 4;
   if inp[i] ne . then out[inp[i]]=inp[i];
  end;
  keep red orange green blue;

run;quit;
proc print;
run;quit;
');

