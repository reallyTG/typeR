library(synlik)


### Name: nlar
### Title: Estimate non-linear autoregressive coefficients
### Aliases: nlar

### ** Examples

  library(synlik)
  set.seed(10)
  x <- matrix(runif(200),100,2)
  beta <- nlar(x,lag=c(1,1),power=c(1,2))
  y <- x[,1]
  y <- y - mean(y)
  z <- y[1:99];y <- y[2:100]
  lm(y~z+I(z^2)-1)
  beta
  
  ## NA testing
  x[5,1] <- x[45,2] <- NA
  beta <- nlar(x,lag=c(1,1),power=c(1,2))
  y <- x[,1]
  y <- y - mean(y,na.rm=TRUE)
  z <- y[1:99];y <- y[2:100]
  lm(y~z+I(z^2)-1)
  beta
  
  ## higher order...
  set.seed(10)
  x <- matrix(runif(100),100,2)
  beta <- nlar(x,lag=c(6,6,6,1,1),power=c(1,2,3,1,2))
  k <- 2
  y <- x[,k]
  y <- y - mean(y)
  ind <- (1+6):100
  y6 <- y[ind-6];y1 <- y[ind-1];y <- y[ind]
  beta0 <- coef(lm(y~y6+I(y6^2)+I(y6^3)+y1+I(y1^2)-1))
  as.numeric(beta[,k]);beta0;beta0-as.numeric(beta[,k])



