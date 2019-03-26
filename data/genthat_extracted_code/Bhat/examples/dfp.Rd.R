library(Bhat)


### Name: dfp
### Title: Function minimization with box-constraints
### Aliases: dfp
### Keywords: optimize methods

### ** Examples

        # generate some Poisson counts on the fly
          dose <- c(rep(0,50),rep(1,50),rep(5,50),rep(10,50))
          data <- cbind(dose,rpois(200,20*(1+dose*.5*(1-dose*0.05))))

        # neg. log-likelihood of Poisson model with 'linear-quadratic' mean: 
          lkh <- function (x) { 
          ds <- data[, 1]
          y  <- data[, 2]
          g <- x[1] * (1 + ds * x[2] * (1 - x[3] * ds)) 
          return(sum(g - y * log(g)))
          }

	# for example define
          x <- list(label=c("a","b","c"),est=c(10.,10.,.01),low=c(0,0,0),upp=c(100,20,.1))

	# call:
	  results <- dfp(x,f=lkh)



