library(iterLap)


### Name: iterLap
### Title: Iterated Laplace Approximation
### Aliases: iterLap
### Keywords: misc

### ** Examples

  #### banana example
  banana <- function(pars, b, sigma12){
    dim <- 10
    y <- c(pars[1], pars[2]+b*(pars[1]^2-sigma12), pars[3:dim])
    cc <- c(1/sqrt(sigma12), rep(1, dim-1))
    return(-0.5*sum((y*cc)^2))
  }

  ###############################################################
  ## first perform multi mode Laplace approximation
  start <- rbind(rep(0,10),rep(-1.5,10),rep(1.5,10))
  grObj <- GRApprox(banana, start, b = 0.03, sigma12 = 100)
  ## print mixDist object
  grObj
  ## summary method
  summary(grObj)
  ## importance sampling using the obtained mixDist object 
  ## using a mixture of t distributions with 10 degrees of freedom
  isObj <- IS(grObj, nSim=1000, df = 10, post=banana, b = 0.03,
              sigma12 = 100)
  ## effective sample size
  isObj$ESS
  ## independence Metropolis Hastings algorithm
  imObj <- IMH(grObj, nSim=1000, df = 10, post=banana, b = 0.03,
               sigma12 = 100)
  ## acceptance rate
  imObj$accept

  ###############################################################
  ## now use iterated Laplace approximation
  ## and use Laplace approximation above as starting point
  iL <- iterLap(banana, GRobj = grObj, b = 0.03, sigma12 = 100)
  isObj2 <- IS(iL, nSim=10000, df = 100, post=banana, b = 0.03,
               sigma12 = 100)
  ## residual resampling to obtain unweighted sample
  samples <- resample(1000, isObj2)
  ## plot samples in the first two dimensions
  plot(samples[,1], samples[,2], xlim=c(-40,40), ylim = c(-40,20))
  ## independence Metropolis algorithm
  imObj2 <- IMH(iL, nSim=1000, df = 10, post=banana, b = 0.03,
                sigma12 = 100)
  imObj2$accept
  plot(imObj2$samp[,1], imObj2$samp[,2], xlim=c(-40,40), ylim = c(-40,20))

  ## IMH and IS can exploit multiple cores, example for two cores
  ## Not run: 
##D   isObj3 <- IS(iL, nSim=10000, df = 100, post=banana, b = 0.03,
##D                sigma12 = 100, cores = 2)
##D   
## End(Not run)




