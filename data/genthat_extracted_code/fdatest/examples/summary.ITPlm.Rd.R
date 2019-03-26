library(fdatest)


### Name: summary.ITPlm
### Title: Summarizing Functional-on-Scalar Linear Model Fits
### Aliases: summary.ITPlm
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

temperature <- rbind(NASAtemp$milan,NASAtemp$paris)
groups <- c(rep(0,22),rep(1,22))

# Performing the ITP
ITP.result <- ITPlmbspline(temperature ~ groups, B=1000,nknots=20)

# Summary of the ITP results
summary(ITP.result)




