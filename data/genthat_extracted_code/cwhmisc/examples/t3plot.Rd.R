library(cwhmisc)


### Name: T3plot
### Title: T3plot
### Aliases: T3plot
### Keywords: distribution

### ** Examples

  par(mfrow=c(2,2))
  T3plot(rnorm(100))
  T3plot(rnorm(10000))
  T3plot(rnorm(1000)+runif(1000)*0.1,"Mixture,rather well normal")
  T3plot(rnorm(1000)+runif(1000)*10,"Not < 1 percent error for normality")



