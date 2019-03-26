library(cwhmisc)


### Name: pointfit
### Title: Least squares fit of point clouds, or the 'Procrustes' problem.
### Aliases: pointfit
### Keywords: algebra

### ** Examples

  # nodes of a pyramid
  A <- matrix(c(1,0,0,0,2,0,0,0,3,0,0,0),4,3,byrow=TRUE)
  nr <- nrow(A)
  v <- c(1,2,3,4,1,3,4,2)  # edges to be plotted
#  plot
  # points on the pyramid
  x <-
matrix(c(0,0,0,0.5,0,1.5,0.5,1,0,0,1.5,0.75,0,0.5,
2.25,0,0,2,1,0,0),
    7,3,byrow=TRUE)
  # simulate measured points
  # theta <- runif(3)
  theta <- c(pi/4, pi/15, -pi/6)
  # orthogonal rotations to construct Qr
  Qr <- rotL(theta[3]) %*% rotL(theta[2],1,3) %*% rotL(theta[1],1)
  # translation vector
  # tr <- runif(3)*3
  tr <- c(1,3,2)
  # compute the transformed pyramid
  fr <- 1.3
  B <- fr * A %*% Qr + outer(rep(1,nr),tr)
  # distorted points
  # xi <- fr * x + outer(rep(1,nr),tr) + rnorm(length(x))/10
  xi <- matrix(c(0.8314,3.0358,1.9328,0.9821,4.5232,2.8703,1.0211,3.8075,1.0573,
0.1425,4.4826,1.5803,0.2572,5.0120,3.1471,0.5229,4.5364,3.5394,1.7713,
3.3987,1.9054),7,3,byrow=TRUE)
  (pf <- pointfit(xi,x))
  # the fitted pyramid
  (C <- A %*% pf$Q + outer(rep(1,nrow(A)),pf$tr))  ## !!!!!!  %*% instead of %*%
  # As a final check we generate the orthogonal matrix S from the computed angles
  # theta and compare it with the result pf$Q
  Ss <- rotL(theta[3]) 
  range(svd(Ss*pf$factor - pf$Q)$d) #  6.652662e-17 1.345509e-01



