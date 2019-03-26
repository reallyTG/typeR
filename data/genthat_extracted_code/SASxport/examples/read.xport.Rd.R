library(SASxport)


### Name: read.xport
### Title: Import a SAS XPORT File
### Aliases: read.xport
### Keywords: interface manip

### ** Examples


## -------
## SAS code to generate test dataset:
## -------
## libname y SASV5XPT "test2.xpt";
##
## PROC FORMAT; VALUE race 1=green 2=blue 3=purple; RUN;
## PROC FORMAT CNTLOUT=format;RUN;  * Name, e.g. 'format', unimportant;
## data test;
## LENGTH race 3 age 4;
## age=30; label age="Age at Beginning of Study";
## race=2;
## d1='3mar2002'd ;
## dt1='3mar2002 9:31:02'dt;
## t1='11:13:45't;
## output;
##
## age=31;
## race=4;
## d1='3jun2002'd ;
## dt1='3jun2002 9:42:07'dt;
## t1='11:14:13't;
## output;
## format d1 mmddyy10. dt1 datetime. t1 time. race race.;
## run;
## data z; LENGTH x3 3 x4 4 x5 5 x6 6 x7 7 x8 8;
##    DO i=1 TO 100;
##        x3=ranuni(3);
##        x4=ranuni(5);
##        x5=ranuni(7);
##        x6=ranuni(9);
##        x7=ranuni(11);
##        x8=ranuni(13);
##        output;
##        END;
##    DROP i;
##    RUN;
## PROC MEANS; RUN;
## PROC COPY IN=work OUT=y;SELECT test format z;RUN; *Creates test2.xpt;
## ------

## Read this dataset from a local file:
testFile <- system.file('extdata', 'test2.xpt', package="SASxport")
w <- read.xport(testFile)
class(w)
sapply(w, head)

## Not run: 
##D ## Or read a copy of test2.xpt available on the web:
##D url <- 'http://biostat.mc.vanderbilt.edu/wiki/pub/Main/Hmisc/test2.xpt'
##D w <- read.xport(url)
## End(Not run)

## We can also get the dataset wrapped in a list
w <- read.xport(testFile, as.list=TRUE)
class(w)
sapply(w, head)

## And we can ask for the format information to be included as well.
w <- read.xport(testFile, as.list=TRUE, include.formats=TRUE)
class(w)
sapply(w, head)

## Don't show: 
stopifnot( is.data.frame(w)==FALSE && is.list(w)==TRUE )
## End(Don't show)

#### The Hmisc library provides many useful functions for interacting with
#### data imported from SAS via read.xport()
library(Hmisc)

describe(w$TEST)   # see labels, format names for dataset test
lapply(w, describe, "")# see descriptive stats in more detail for each variable

contents(w$TEST)   # another way to see variable attributes
lapply(w, contents)# show contents of individual items in more detail

options(digits=7)  # compare the following matrix with PROC MEANS output
t(sapply(w$Z, function(x)
 c(Mean=mean(x),SD=sqrt(var(x)),Min=min(x),Max=max(x))))




