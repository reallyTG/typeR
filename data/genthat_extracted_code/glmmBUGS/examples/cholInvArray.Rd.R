library(glmmBUGS)


### Name: cholInvArray
### Title: Precision matrices to variance matrices for Winbugs output
### Aliases: cholInvArray

### ** Examples

# create a random positive definite matrix by 
# generating a lower triangle
  N=4
  lmat = diag(runif(N, 1, 10))
  thetri = lower.tri(lmat)
  lmat[thetri] = rnorm(sum(thetri), 0, 2)
#  precmat = solve(lmat %*% t(lmat))
  precmat = solve(lmat %*% t(lmat))
 
# put this matrix into an array 
  precarray = array(c(precmat), dim=c(1,1,length(precmat)))
  dimnames(precarray) = list(NULL, NULL, 
    paste("T[", rep(1:N, N), ",", rep(1:N, rep(N,N)), "]",sep="") )

# invert it with cholInvArray and the solve function
  cholInvArray(precarray)[1,1,]
  # the off diagonals of solve(precmat) should be 
  # the covT elements of cholInvArray(precarray)
  solve(precmat)
  # the standard deviations in cholInvArray(precarray) should be the 
  # root of the diagonals of solve(precmat)
  sqrt(diag(solve(precmat)))



