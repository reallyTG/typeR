library(highfrequency)


### Name: BNSjumptest
### Title: Barndorff- Nielsen and Shephard (2006) tests for the presence of
###   jumps in the price series.
### Aliases: BNSjumptest
### Keywords: highfrequency BNSjumptest

### ** Examples

data(sample_tdata)
BNSjumptest(sample_tdata$PRICE, IVestimator= "minRV", 
            IQestimator = "medRQ", type= "linear", makeReturns = TRUE)



