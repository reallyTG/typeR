library(SHELF)


### Name: SHELF-package
### Title: Tools to Support the Sheffield Elicitation Framework
### Aliases: SHELF-package SHELF

### ** Examples

## Not run: 
##D ## 1) Elicit judgements from two experts individually 
##D # Expert A states P(X<30)=0.25, P(X<40)=0.5, P(X<50)=0.75
##D # Expert B states P(X<20)=0.25, P(X<25)=0.5, P(X<35)=0.75
##D # Both experts state 0<X<100.
##D 
##D ## 2) Fit distributions to each expert's judgements
##D v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
##D p <- c(0.25, 0.5, 0.75)
##D myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
##D 
##D ## 3) Plot the fitted distributions, including a linear pool
##D plotfit(myfit, lp = T)
##D 
##D ## 4) Now elicit a single 'consensus' distribution from the two experts
##D # Suppose they agree P(X<25)=0.25, P(X<30)=0.5, P(X<40)=0.75
##D v <-c(25, 30, 40)
##D p <-c(0.25, 0.5, 0.75)
##D myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
##D 
##D ## 5) Plot the fitted density, and report some feedback, such as the 
##D # fitted 5th and 95th percentiles
##D plotfit(myfit, ql = 0.05, qu = 0.95)
##D feedback(myfit, quantiles = c(0.05, 0.95))
##D 
##D ## Can also use interactive plotting
##D v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
##D p <- c(0.25, 0.5, 0.75)
##D myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
##D # plot each distribution
##D plotfit(myfit, int = TRUE)
##D 
##D ## plot the distribution for one expert only
##D plotfit(myfit, int = TRUE, ex = 1)
##D 
##D ## Enter judgements in interactive mode
##D elicit()
##D 
##D ## Enter judgements using the roulette method
##D roulette(lower = 0, upper = 100, nbins = 10, gridheight = 10)
## End(Not run)



