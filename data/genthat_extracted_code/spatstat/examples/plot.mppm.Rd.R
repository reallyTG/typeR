library(spatstat)


### Name: plot.mppm
### Title: plot a Fitted Multiple Point Process Model
### Aliases: plot.mppm
### Keywords: spatial hplot models

### ** Examples

  # Synthetic data from known model
  n <- 9
  H <- hyperframe(V=1:n,
                  U=runif(n, min=-1, max=1))
  H$Z <- setcov(square(1))
  H$U <- with(H, as.im(U, as.rectangle(Z)))
  H$Y <- with(H, rpoispp(eval.im(exp(2+3*Z))))

  fit <- mppm(Y ~Z + U + V, data=H)

  plot(fit)



