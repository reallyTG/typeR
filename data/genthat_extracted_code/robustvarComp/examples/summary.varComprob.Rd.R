library(robustvarComp)


### Name: summary.varComprob
### Title: Summary Method for "varComprob" Objects
### Aliases: summary.varComprob
### Keywords: robust multivariate regression

### ** Examples

  if (!require(nlme))
    stop()
  data(Orthodont)

  z1 <- rep(1, 4)
  z2 <- c(8,10,12,14)
  K <- list()
  K[[1]] <- tcrossprod(z1,z1) ## Int
  K[[2]] <- tcrossprod(z1,z2) + tcrossprod(z2,z1) ## Int:age
  K[[3]] <- tcrossprod(z2,z2) ## age
  names(K) <- c("Int", "Int:age", "age")
  p <- 4
  n <- 27
  groups <- cbind(rep(1:p, each=n), rep((1:n), p))

  ## Composite Tau
  OrthodontCompositeTau <- varComprob(distance ~ age*Sex, groups = groups,
    data = Orthodont, varcov = K,
    control=varComprob.control(lower=c(0,-Inf,0)))

  summary(OrthodontCompositeTau, print.outliers=TRUE)



