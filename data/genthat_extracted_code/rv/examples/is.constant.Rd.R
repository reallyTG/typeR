library(rv)


### Name: is.constant
### Title: Constant Vectors
### Aliases: is.constant as.constant as.constant.rv as.constant.rvsummary
### Keywords: classes

### ** Examples


  is.constant(1)         # TRUE
  is.constant(as.rv(1))  # TRUE
  setnsims(200)
  x <- rvbern(prob=0.001)
  all(sims(x)==0)        # most probably true
  is.constant(x)         # always FALSE
  x <- rvnorm(3)
  x[1] <- 1
  as.constant(x)         # 1, NA, NA
  all(is.random(x) & is.na(as.constant(x))) # always TRUE




