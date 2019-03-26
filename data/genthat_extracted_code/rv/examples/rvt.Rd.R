library(rv)


### Name: rvt
### Title: Generate Random Variables from a Student-t Sampling Model
### Aliases: rvt
### Keywords: classes

### ** Examples


  df <- 3
  x <- rvt(n=1, df=df)
  y <- rvnorm(1)/sqrt(rvchisq(1, df=df)/df) # Same distribution as above
  print(c(x,y))#'   




