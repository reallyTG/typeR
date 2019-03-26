library(KFAS)


### Name: mvInnovations
### Title: Multivariate Innovations
### Aliases: mvInnovations

### ** Examples


# Compute the filtered estimates based on the KFS output

filtered <- function(x) {
  innov <- mvInnovations(x)
  att <- window(x$a, end = end(x$a) - 1)
  tvz <- attr(x$model,"tv")[1]
  
  for (i in 1:nrow(att)) {
    att[i,] <- att[i,] + 
      x$P[,,i] %*% 
      t(solve(innov$F[,,i], x$model$Z[, , tvz * (i - 1) + 1, drop = FALSE])) %*%
      innov$v[i, ]
  }
  att
}



