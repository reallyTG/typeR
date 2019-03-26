library(Hmisc)


### Name: upData
### Title: Update a Data Frame or Cleanup a Data Frame after Importing
### Aliases: cleanup.import upData dataframeReduce
### Keywords: data manip

### ** Examples

## Not run: 
##D dat <- read.table('myfile.asc')
##D dat <- cleanup.import(dat)
## End(Not run)
dat <- data.frame(a=1:3, d=c('01/02/2004',' 1/3/04',''))
cleanup.import(dat, datevars='d', dateformat='%m/%d/%y', fixdates='year')

dat <- data.frame(a=(1:3)/7, y=c('a','b1','b2'), z=1:3)
dat2 <- upData(dat, x=x^2, x=x-5, m=x/10, 
               rename=c(a='x'), drop='z',
               labels=c(x='X', y='test'),
               levels=list(y=list(a='a',b=c('b1','b2'))))
dat2
describe(dat2)
dat <- dat2    # copy to original name and delete dat2 if OK
rm(dat2)
dat3 <- upData(dat, X=X^2, subset = x < (3/7)^2 - 5, rename=c(x='X'))

# Remove hard to analyze variables from a redundancy analysis of all
# variables in the data frame
d <- dataframeReduce(dat, fracmiss=.1, minprev=.05, maxlevels=5)
# Could run redun(~., data=d) at this point or include dataframeReduce
# arguments in the call to redun

# If you import a SAS dataset created by PROC CONTENTS CNTLOUT=x.datadict,
# the LABELs from this dataset can be added to the data.  Let's also
# convert names to lower case for the main data file
## Not run: 
##D mydata2 <- cleanup.import(mydata2, lowernames=TRUE, sasdict=datadict)
## End(Not run)



