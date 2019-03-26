library(FSA)


### Name: Summarize
### Title: Summary statistics for a numeric variable.
### Aliases: Summarize Summarize.default Summarize.formula
### Keywords: misc

### ** Examples

## Create a data.frame of "data"
n <- 102
d <- data.frame(y=c(0,0,NA,NA,NA,runif(n-5)),
                w=sample(7:9,n,replace=TRUE),
                v=sample(0:2,n,replace=TRUE),
                g1=factor(sample(c("A","B","C",NA),n,replace=TRUE)),
                g2=factor(sample(c("male","female","UNKNOWN"),n,replace=TRUE)),
                g3=sample(c("a","b","c","d"),n,replace=TRUE),
                stringsAsFactors=FALSE)

# typical output of summary() for a numeric variable
summary(d$y)   

# this function           
Summarize(d$y,digits=3)
Summarize(~y,data=d,digits=3)
Summarize(y~1,data=d,digits=3)

# note that nvalid is not shown if there are no NAs and
#   percZero is not shown if there are no zeros
Summarize(~w,data=d,digits=3)
Summarize(~v,data=d,digits=3)

# note that the nvalid and percZero results can be forced to be shown
Summarize(~w,data=d,digits=3,nvalid="always",percZero="always")

## Numeric vector by levels of a factor variable
Summarize(y~g1,data=d,digits=3)
Summarize(y~g2,data=d,digits=3)
Summarize(y~g2,data=d,digits=3,exclude="UNKNOWN")

## Numeric vector by levels of two factor variables
Summarize(y~g1+g2,data=d,digits=3)
Summarize(y~g1+g2,data=d,digits=3,exclude="UNKNOWN")

## What happens if RHS of formula is not a factor
Summarize(y~w,data=d,digits=3)

## Summarizing multiple variables in a data.frame (must reduce to numerics)
lapply(as.list(d[,1:3]),Summarize,digits=4)




