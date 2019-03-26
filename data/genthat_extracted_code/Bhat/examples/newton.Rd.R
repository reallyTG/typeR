library(Bhat)


### Name: newton
### Title: Function minimization with box-constraints
### Aliases: newton
### Keywords: optimize methods

### ** Examples

        # generate some Poisson counts on the fly
          dose <- c(rep(0,100),rep(1,100),rep(5,100),rep(10,100))
          data <- cbind(dose,rpois(400,20*(1+dose*.5*(1-dose*0.05))))

        # neg. log-likelihood of Poisson model with 'linear-quadratic' mean: 
          lkh <- function (x) { 
          ds <- data[, 1]
          y  <- data[, 2]
          g <- x[1] * (1 + ds * x[2] * (1 - x[3] * ds)) 
          return(sum(g - y * log(g)))
          }

	# for example define
          x <- list(label=c("a","b","c"),est=c(10.,10.,.01),low=c(0,0,0),upp=c(100,20,.1))

	# calls:
	  r <- dfp(x,f=lkh)
          x$est <- r$est
          results <- newton(x,lkh)



