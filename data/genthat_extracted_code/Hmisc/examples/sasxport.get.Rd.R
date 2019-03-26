library(Hmisc)


### Name: sasxport.get
### Title: Enhanced Importing of SAS Transport Files using read.xport
### Aliases: sasxport.get sasdsLabels
### Keywords: interface manip

### ** Examples

## Not run: 
##D # SAS code to generate test dataset:
##D # libname y SASV5XPT "test2.xpt";
##D #
##D # PROC FORMAT; VALUE race 1=green 2=blue 3=purple; RUN;
##D # PROC FORMAT CNTLOUT=format;RUN;  * Name, e.g. 'format', unimportant;
##D # data test;
##D # LENGTH race 3 age 4;
##D # age=30; label age="Age at Beginning of Study";
##D # race=2;
##D # d1='3mar2002'd ;
##D # dt1='3mar2002 9:31:02'dt;
##D # t1='11:13:45't;
##D # output;
##D #
##D # age=31;
##D # race=4;
##D # d1='3jun2002'd ;
##D # dt1='3jun2002 9:42:07'dt;
##D # t1='11:14:13't;
##D # output;
##D # format d1 mmddyy10. dt1 datetime. t1 time. race race.;
##D # run;
##D # data z; LENGTH x3 3 x4 4 x5 5 x6 6 x7 7 x8 8;
##D #    DO i=1 TO 100;
##D #        x3=ranuni(3);
##D #        x4=ranuni(5);
##D #        x5=ranuni(7);
##D #        x6=ranuni(9);
##D #        x7=ranuni(11);
##D #        x8=ranuni(13);
##D #        output;
##D #        END;
##D #    DROP i;
##D #    RUN;
##D # PROC MEANS; RUN;
##D # PROC COPY IN=work OUT=y;SELECT test format z;RUN; *Creates test2.xpt;
##D w <- sasxport.get('test2.xpt')
##D # To use an existing copy of test2.xpt available on the web:
##D w <- sasxport.get('http://biostat.mc.vanderbilt.edu/wiki/pub/Main/Hmisc/test2.xpt')
##D 
##D describe(w$test)   # see labels, format names for dataset test
##D # Note: if only one dataset (other than format) had been exported,
##D # just do describe(w) as sasxport.get would not create a list for that
##D lapply(w, describe)# see descriptive stats for both datasets
##D contents(w$test)   # another way to see variable attributes
##D lapply(w, contents)# show contents of both datasets
##D options(digits=7)  # compare the following matrix with PROC MEANS output
##D t(sapply(w$z, function(x)
##D  c(Mean=mean(x),SD=sqrt(var(x)),Min=min(x),Max=max(x))))
## End(Not run)



