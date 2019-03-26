library(iterLap)


### Name: GRApprox
### Title: Gelman-Rubin mode approximation
### Aliases: GRApprox
### Keywords: misc

### ** Examples


  ## log-density for banana example
  banana <- function(pars, b, sigma12){
    dim <- 10
    y <- c(pars[1], pars[2]+b*(pars[1]^2-sigma12), pars[3:dim])
    cc <- c(1/sqrt(sigma12), rep(1, dim-1))
    return(-0.5*sum((y*cc)^2))
  }

  start <- rbind(rep(0,10),rep(-1.5,10),rep(1.5,10))
  ## multiple mode Laplace approximation
  aa <- GRApprox(banana, start, b = 0.03, sigma12 = 100)
  ## print mixDist object
  aa
  ## summary method
  summary(aa)
  ## importance sampling using the obtained mixDist object 
  ## using a mixture of t distributions with 10 degrees of freedom
  dd <- IS(aa, nSim=1000, df = 10, post=banana, b = 0.03,
           sigma12 = 100)
  ## effective sample size
  dd$ESS



