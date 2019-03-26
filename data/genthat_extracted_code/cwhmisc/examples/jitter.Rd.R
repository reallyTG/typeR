library(cwhmisc)


### Name: jitterNA
### Title: Jitter vector containing NA
### Aliases: jitterNA
### Keywords: data NA

### ** Examples

  d <- data.frame(cbind(x=1, y=1:10))
  d[5,1] <- d[3,2] <- NA
  jitterNA(d)



