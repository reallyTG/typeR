library(timeSeries)


### Name: merge
### Title: Merges two 'timeSeries' objects
### Aliases: merge merge,ANY,timeSeries-method merge,timeSeries,ANY-method
###   merge,timeSeries,missing-method merge,timeSeries,numeric-method
###   merge,timeSeries,matrix-method merge,timeSeries,timeSeries-method
###   merge,matrix,timeSeries-method merge,numeric,timeSeries-method
### Keywords: chron

### ** Examples

## Load Series -
   x <- MSFT[1:12, ]

## Merge 'timeSeries' with missing Object -
   merge(x)

## Merge 'timeSeries' with numeric Object -
   y <- rnorm(12)
   class(y)
   merge(x, y)

## Merge 'timeSeries' with matrix Object -
   y <- matrix(rnorm(24), ncol=2)
   class(y)
   merge(x, y)

## Merge 'timeSeries' with matrix Object -
   y <- timeSeries(data=rnorm(12), charvec=time(x))
   class(y)
   merge(x, y)



