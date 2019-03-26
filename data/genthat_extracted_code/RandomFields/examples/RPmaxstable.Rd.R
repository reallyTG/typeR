library(RandomFields)


### Name: Max-stable random fields
### Title: Simulation of Max-Stable Random Fields
### Aliases: maxstable Maxstable RPmaxstable
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

### currently not programmed

## Don't show: 
## Not run: 
##D  ## to do !!
##D model <- RMfbm(alpha=1.5)
##D x <-  seq(0, 8, 0.02)
##D z <- RFsimulate(RPbrownresnick(model), x=x, n=4)
##D plot(z)
## End(Not run)## End(Don't show)

## Not run: 
##D \dontshow{
##D ## to do : seq(0, 10, 0.02) oben ist furchtbar langsam. Warum?
##D }
## End(Not run)

## Not run: 
##D \dontshow{
##D model <- RMball()
##D x <- seq(0, 10, 5) # nice for   x <- seq(0, 10, 0.02)
##D z <- RFsimulate(RPsmith(model, xi=0), x, n=1000, every=1000)
##D plot(z)
##D hist(unlist(z@data), 150, freq=FALSE) #not correct; to do; sqrt(2) wrong
##D curve(exp(-x) * exp(-exp(-x)), from=-3, to=8, add=TRUE, col=3)
##D }
## End(Not run)

model <- RMgauss()
x <- seq(0, 10, 0.05)
z <- RFsimulate(RPschlather(model, xi=0), x, n=1000)
plot(z)
hist(unlist(z@data), 50, freq=FALSE)
curve(exp(-x) * exp(-exp(-x)), from=-3, to=8, add=TRUE)


## for some more sophisticated models see maxstableAdvanced
## Don't show: 
FinalizeExample()
## End(Don't show)


