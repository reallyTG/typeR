library(highfrequency)


### Name: AJjumptest
### Title: Ait- Sahalia and Jacod (2009) tests for the presence of jumps in
###   the price series.
### Aliases: AJjumptest
### Keywords: highfrequency AJjumptest

### ** Examples

data(sample_tdata)
AJjumptest(sample_tdata$PRICE, p= 2, k= 3, align.by= "seconds", align.period= 5, makeReturns= TRUE)



