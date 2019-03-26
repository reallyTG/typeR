library(SyNet)


### Name: reweight
### Title: Reweighting of Links from an Adjacency Weighted Matrix
### Aliases: reweight
### Keywords: methods

### ** Examples

  #Example to show an interesting numerical property of the reweighting formula, i.e.
  #its convergence to the same rescaled matrix after several self-iterations
  nitems <- 25
  ej <- matrix(0, nitems, nitems)
  ej[row(ej) > col(ej)] <- runif(nitems*(nitems - 1)/2)
  t(ej) + ej -> ej
  diag(ej) <- 1
  ### Display three graphics
  op <- par(mar = rep(3, 4), mfrow = c(3, 1))
  plot(unlist(ej),unlist(reweight(ej)), xlab = "Input matrix", ylab = "Reweighted matrix", main = "First reweighting")
  #Iterative reweighting
  histcor <- c()
  #Perform 100 iterations
  for(i in 1:100) {
    reweight(ej) -> rej
    b <- c()
    for(k in 1:(nrow(ej) - 1))
      for(j in (k + 1):nrow(ej)) {
        a <- (ej[k, j] >= ej[k, ]) + (rej[k, j] >= rej[k, ])
        b <- c(b, sum(a==2)/sum(a > 0))
    }
    histcor <- c(histcor, mean(b))
    ej <- rej
  }
  plot(unlist(ej),unlist(reweight(ej)), xlab = "Input matrix", ylab = "Reweighted matrix",
       main = "Reweighting after several iterations")
  plot(histcor, xlab = "Iteration", ylab = "Cross adjustment",
       main = "Evolution of the resemblance between input and reweigthed network")
  ## At end of plotting, reset to previous settings:
  par(op)



