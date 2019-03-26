library(timeSeries)


### Name: dimnames
### Title: Time Series Columns and Rows
### Aliases: dim,timeSeries-method dim<-,timeSeries-method
###   dimnames,timeSeries-method dimnames<-,timeSeries,list-method
###   colnames<-,timeSeries-method colnames,timeSeries-method
###   rownames,timeSeries-method rownames<-,timeSeries,timeDate-method
###   rownames<-,timeSeries,ANY-method names,timeSeries-method
###   names<-,timeSeries-method
### Keywords: chron

### ** Examples

## Load Swiss Pension Fund Benchmark Data -
   X <- LPP2005REC[1:10, 1:3]
   
## Get Dimension - 
   dim(X)
   
## Get Column and Row Names -
   dimnames(X)
   
## Get Column / Row Names -
   colnames(X)
   rownames(X) 
   
## Try your own DIM - 
   DIM <- function(x) {c(NROW(x), NCOL(x))}
   DIM(X) 
   DIM(X[, 1])

## Try length / LENGTH - 
   length(X)
   length(X[, 1])
   LENGTH <- function(X) NROW(X)
   LENGTH(X)
   
## Columns / Rows - 
   ncol(X); NCOL(X)
   nrow(X); NROW(X)
                
## See also - 
   isUnivariate(X)
   isMultivariate(X)



