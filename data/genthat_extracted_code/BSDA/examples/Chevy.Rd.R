library(BSDA)


### Name: Chevy
### Title: Insurance injury ratings of Chevrolet vehicles for 1990 and 1993
###   models
### Aliases: Chevy
### Keywords: datasets

### ** Examples


T1 <- xtabs(~year + frequency, data = Chevy)
T1
chisq.test(T1)
rm(T1)




