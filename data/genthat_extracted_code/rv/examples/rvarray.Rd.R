library(rv)


### Name: rvmatrix
### Title: Matrices and Arrays of Random Vectors
### Aliases: rvmatrix rvarray is.matrix.rv as.matrix.rv
### Keywords: classes

### ** Examples


  n.rows <- 3; n.cols <- 4; n <- (n.rows*n.cols)
  mu.true <- rnorm(1:n.rows, mean=1:n.rows, sd=1)
  theta <- rvmatrix(rvnorm(n=n.cols, mean=mu.true, sd=0.5), nrow=n.rows)
  col.labels <- paste("Time", 1:n.cols, sep=":")
  row.labels <- paste("Unit", 1:n.rows, sep=":")
  dimnames(theta) <- list(row.labels, col.labels)
  print(theta)
  print(E(theta))  




