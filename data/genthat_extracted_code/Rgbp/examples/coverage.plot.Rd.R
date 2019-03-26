library(Rgbp)


### Name: coverage.plot
### Title: Drawing the coverage plot
### Aliases: coverage.plot
### Keywords: methods

### ** Examples


  # baseball data where z is Hits and n is AtBats
  z <- c(18, 17, 16, 15, 14, 14, 13, 12, 11, 11, 10, 10, 10, 10, 10,  9,  8,  7)
  n <- c(45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45)

  b <- gbp(z, n, model = "binomial")
  cov <- coverage(b, nsim = 10)  
  coverage.plot(cov)




