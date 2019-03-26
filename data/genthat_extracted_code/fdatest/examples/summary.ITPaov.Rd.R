library(fdatest)


### Name: summary.ITPaov
### Title: Summarizing Functional Analysis of Variance Fits
### Aliases: summary.ITPaov
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

temperature <- rbind(NASAtemp$milan,NASAtemp$paris)
groups <- c(rep(0,22),rep(1,22))

# Performing the ITP
ITP.result <- ITPaovbspline(temperature ~ groups,B=1000,nknots=20,order=3)

# Summary of the ITP results
summary(ITP.result)





