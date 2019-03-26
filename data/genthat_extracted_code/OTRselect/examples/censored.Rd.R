library(OTRselect)


### Name: censored
### Title: Variable Selection for Optimal Treatment Decision with Censored
###   Survival Times
### Aliases: censored

### ** Examples

  sigma <- diag(10)
  ct <- 0.5^{1L:9L}
  rst <- unlist(sapply(1L:9L,function(x){ct[1L:{10L-x}]}))
  sigma[lower.tri(sigma)] <- rst
  sigma[upper.tri(sigma)] <- t(sigma)[upper.tri(sigma)]

  M <- t(chol(sigma))
  Z <- matrix(rnorm(1000),10,100)
  X <- t(M%*%Z)

  A <- rbinom(100,1,0.5)

  Y <- rweibull(100,shape=0.5,scale=1)
  C <- rweibull(100,shape=0.5,scale=1.5)

  delta <- as.integer(C <= Y)

  Y[delta > 0.5] <- C[delta>0.5]

  dat <- data.frame(X,A,exp(Y),delta)
  colnames(dat) <- c(paste("X",1:10,sep=""),"a","y","del")
  
  censored(x = X, 
           y = Y, 
           a = A, 
           delta = delta,
           propen = 0.5, 
           phi = "c", 
           logY = TRUE, 
           intercept = TRUE)



