library(gMWT)


### Name: plot.estPI
### Title: Plot an estPI Object
### Aliases: plot.estPI plot-method plot,estPI-method
### Keywords: methods plot

### ** Examples

  X <- c(sample(15))
  g <- c(1,1,1,2,2,2,2,3,3,3,4,4,4,4,4)
  res <- estPI(X,g,type="single")
  plot(res)

  X <- matrix(c(rnorm(5000,1.5,2),rnorm(6000,2,2),rnorm(4000,3.5,1),rnorm(3000,2.5,1)),
           byrow=TRUE, ncol=100)
  colnames(X) <- letters[1:100]
  g <- c(rep(1,50),rep(2,60),rep(3,40),rep(4,30))

  res <- estPI(X,g,type="single")
  plot(res)



