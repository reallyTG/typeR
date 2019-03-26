## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  v = rnorm(1e8) # 100 million
#  system.time(sum(v*v))
#  #   user  system elapsed
#  #   0.24    0.17    0.40
#  system.time(crossprod(v))
#  #   user  system elapsed
#  #   0.24    0.00    0.23
#  
#  v = rnorm(1e9) # 1000 million
#  system.time(sum(v*v))
#  #   user  system elapsed
#  #   3.25   45.71  141.76
#  system.time(crossprod(v))
#  #   user  system elapsed
#  #   2.99    0.72   19.20
#  
#  v = 1:1e6 # 1 million
#  system.time(crossprod(v))
#  #   user  system elapsed
#  #      0       0       0
#  system.time(sum(v*v))
#  #   user  system elapsed
#  #      0       0       0
#  #Warning message:
#  #In k * k : NAs produced by integer overflow

## ---- eval=FALSE---------------------------------------------------------
#  x = matrix(rnorm(10000), nrow=10, ncol=1000)
#  system.time(colSums(x*x))
#  #   user  system elapsed
#  #      0       0       0
#  system.time(crossprod(x))
#  #   user  system elapsed
#  #   0.83    0.14    0.97

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(42)
#  Bbig <- matrix(rnorm(100*100), nrow=100)
#  Bbig2 <- Bbig
#  Bbig2[1,1] <- NA

## ---- eval=FALSE---------------------------------------------------------
#  th = x0 %*% ph
#  P = drop(ph) %o% nr.ones # ph in each column, nr.ones is a vector of 1
#  P[t(x.miss)] = 0
#  ph.cross = crossprod(P)
#  th = th / diag(ph.cross)
#  
#  system.time(res0 <- nipals(Bbig2, ncomp=100))
#  #   user  system elapsed
#  #  10.76    0.00   10.78

## ---- eval=FALSE---------------------------------------------------------
#  th = x0 %*% ph
#  P = drop(ph) %o% nr.ones # ph in each column
#  P[t(x.miss)] = 0
#  th = th / colSums(P*P)
#  
#  system.time(res <- nipals(Bbig2, ncomp=100))
#  #   user  system elapsed
#  #    4.4     0.0     4.4
#  
#  all.equal(res0, res)
#  # TRUE

## ---- eval=FALSE---------------------------------------------------------
#  P2 <- drop(ph*ph) %o% nr.ones # ph in each column
#  P2[t(x.miss)] <- 0
#  th = x0 %*% ph / colSums(P2)
#  
#  system.time(res <- nipals(Bbig2, ncomp=100))
#  #   user  system elapsed
#  #      4       0       4
#  
#  all.equal(res0, res)
#  # TRUE

## ---- eval=FALSE---------------------------------------------------------
#  P2 <- matrix(ph*ph, nrow=nc, ncol=nr)
#  P2[t(x.miss)] <- 0
#  th = x0 %*% ph / colSums(P2)
#  
#  system.time(res <- nipals(Bbig2, ncomp=100))
#  #   user  system elapsed
#  #   3.38    0.00    3.41
#  
#  all.equal(res0, res)
#  # TRUE

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(42)
#  P = matrix(rnorm(9), 3)
#  PPp = P %*% t(P)
#  all.equal(PPp,
#            P[,1,drop=FALSE] %*% t(P[,1,drop=FALSE]) +
#            P[,2,drop=FALSE] %*% t(P[,2,drop=FALSE]) +
#            P[,3,drop=FALSE] %*% t(P[,3,drop=FALSE]) )
#  # TRUE
#  
#  all.equal(PPp,
#            tcrossprod(P[,1]) + tcrossprod(P[,2]) + tcrossprod(P[,3]) )
#  # TRUE
#  
#  # multiply by a  vector
#  all.equal( PPp %*% 1:3,
#             tcrossprod(PPp, t(1:3)) )
#  # TRUE

## ---- eval=FALSE---------------------------------------------------------
#  system.time(m1 <- nipals(Bbig2, ncomp=100, gramschmidt=FALSE))
#  #   user  system elapsed
#  #   3.68    0.02    3.70
#  system.time(m2 <- nipals(Bbig2, ncomp=100, gramschmidt=TRUE))
#  #   user  system elapsed
#  #   4.29    0.03    4.37

