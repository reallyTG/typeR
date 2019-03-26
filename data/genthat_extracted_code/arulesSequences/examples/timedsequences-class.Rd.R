library(arulesSequences)


### Name: timedsequences-class
### Title: Class "timedsequences" - Collections of Sequences with Timing
###   Information
### Aliases: timedsequences-class coerce,transactions,timedsequences-method
###   coerce,timedsequences,transactions-method LIST,timedsequences-method
###   show,timedsequences-method show,summary.timedsequences-method
###   summary.timedsequences-class summary,timedsequences-method timesets
###   timesets,timedsequences-method
### Keywords: classes

### ** Examples

## use example data
data(zaki)

## coerce
z <- as(zaki, "timedsequences")
z

## get time sequences
summary(timesets(z))

## coerce back
as(z, "transactions")



