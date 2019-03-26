library(OTRselect)


### Name: uncensored
### Title: Variable Selection for Optimal Treatment Decision with
###   Uncensored Continuous Response
### Aliases: uncensored

### ** Examples

  sigma <- diag(10)
  ct <- 0.5^{1L:9L}
  rst <- unlist(sapply(1L:9L,function(x){ct[1L:{10L-x}]}))
  sigma[lower.tri(sigma)] <- rst
  sigma[upper.tri(sigma)] <- t(sigma)[upper.tri(sigma)]

  M <- t(chol(sigma))
  Z <- matrix(rnorm(1000),10,100)
  X <- t(M %*% Z)

  gamma1 <- c(1, -1, rep(0,8))
  beta <- c(1,1,rep(0,7), -0.9, 0.8)

  A <- rbinom(100,1,0.5)

  Y <- 1.0 + X %*% gamma1 + 
       A*{cbind(1.0,X)%*%beta} + rnorm(100,0,.25)

  dat <- data.frame(X,A,Y)
  
  uncensored(x=X,  
             y = Y,  
             a = A,  
             propen = 0.5,  
             phi = "c",  
             intercept = TRUE)




