library(Hmisc)


### Name: sas.get
### Title: Convert a SAS Dataset to an S Data Frame
### Aliases: sas.get is.special.miss [.special.miss print.special.miss
###   format.special.miss sas.codes code.levels timePOSIXt
### Keywords: interface manip

### ** Examples

## Not run: 
##D sas.contents("saslib", "mice")
##D # [1] "dose"  "ld50"  "strain"  "lab_no"
##D attr(, "n"):
##D # [1] 117
##D mice <- sas.get("saslib", mem="mice", var=c("dose", "strain", "ld50"))
##D plot(mice$dose, mice$ld50)
##D 
##D 
##D nude.mice <- sas.get(lib=unix("echo $HOME/saslib"), mem="mice",
##D 	ifs="if strain='nude'")
##D 
##D 
##D nude.mice.dl <- sas.get(lib=unix("echo $HOME/saslib"), mem="mice",
##D 	var=c("dose", "ld50"), ifs="if strain='nude'")
##D 
##D 
##D # Get a dataset from current directory, recode PROC FORMAT; VALUE ... 
##D # variables into factors with labels of the form "good(1)" "better(2)",
##D # get special missing values, recode missing codes .D and .R into new
##D # factor levels "Don't know" and "Refused to answer" for variable q1
##D d <- sas.get(".", "mydata", recode=2, special.miss=TRUE)
##D attach(d)
##D nl <- length(levels(q1))
##D lev <- c(levels(q1), "Don't know", "Refused")
##D q1.new <- as.integer(q1)
##D q1.new[is.special.miss(q1,"D")] <- nl+1
##D q1.new[is.special.miss(q1,"R")] <- nl+2
##D q1.new <- factor(q1.new, 1:(nl+2), lev)
##D # Note: would like to use factor() in place of as.integer ... but
##D # factor in this case adds "NA" as a category level
##D 
##D 
##D d <- sas.get(".", "mydata")
##D sas.codes(d$x)    # for PROC FORMATted variables returns original data codes
##D d$x <- code.levels(d$x)   # or attach(d); x <- code.levels(x)
##D # This makes levels such as "good" "better" "best" into e.g.
##D # "1:good" "2:better" "3:best", if the original SAS values were 1,2,3
##D 
##D 
##D # Retrieve the same variables from another dataset (or an update of
##D # the original dataset)
##D mydata2 <- sas.get('mydata2', var=names(d))
##D # This only works if none of the original SAS variable names contained _
##D mydata2 <- cleanup.import(mydata2) # will make true integer variables
##D 
##D # Code from Don MacQueen to generate SAS dataset to test import of
##D # date, time, date-time variables
##D # data ssd.test;
##D #     d1='3mar2002'd ;
##D #     dt1='3mar2002 9:31:02'dt;
##D #     t1='11:13:45't;
##D #     output;
##D #
##D #     d1='3jun2002'd ;
##D #     dt1='3jun2002 9:42:07'dt;
##D #     t1='11:14:13't;
##D #     output;
##D #     format d1 mmddyy10. dt1 datetime. t1 time.;
##D # run;
## End(Not run)



