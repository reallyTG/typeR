library(ANOVAreplication)


### Name: Fbar.exact
### Title: F-bar for exact constraints
### Aliases: Fbar.exact
### Keywords: htest

### ** Examples

data <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
aggregate(data$y,by=list(data$g),mean)

#specify exact values to be evaluated. Hi: mu1=102,mu2=123,mu3=143,mu4=135.
exact <- c(102,123,143,135)

Fbar.exact(data,exact)



