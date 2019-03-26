library(DescTools)


### Name: ParseSASDatalines
### Title: Parse a SAS Dataline Command
### Aliases: ParseSASDatalines
### Keywords: IO

### ** Examples

txt <- "
DATA asurvey;
INPUT id sex $ age inc r1 r2 r3 ;
DATALINES;
1   F  35 17  7 2 2
17  M  50 14  5 5 3
33  F  45  6  7 2 7
49  M  24 14  7 5 7
65  F  52  9  4 7 7
81  M  44 11  7 7 7
2   F  34 17  6 5 3
18  M  40 14  7 5 2
34  F  47  6  6 5 6
50  M  35 17  5 7 5
;
"

(d.frm <- ParseSASDatalines(txt))



