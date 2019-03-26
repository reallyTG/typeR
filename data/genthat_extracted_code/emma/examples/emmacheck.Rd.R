library(emma)


### Name: emmacheck
### Title: Checking the need for additional experiments
### Aliases: emmacheck
### Keywords: ~Designed Experiments ~Optimization

### ** Examples

## define the problem variables
in.name <- c("x1", "x2")
nlev <- c(20, 20)
lower <- c(-2.048, -2.048)
upper <- c(2.048, 2.048)
out.name <- "y"
weight <- 1
C <- 10
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

## Not run: 
##D #######################################################
##D ## simulated problem (with known objective function) ##
##D #######################################################
##D ##   identify the initial set of experimental runs (initialization)
##D tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley)
##D 
##D ##   identify the experimental runs during subsequent steps of the 
##D ##	EMMA procedure
##D for(t in 1:(C - 1))
##D {
##D   tn <- emmatn(t, tn, na = 5, opt = "mn", weight, pr.mut = pr.mut, 
##D 	graph = "yes", fn1 = ackley)
##D   tn <- emmacheck(tn, graph = "no", fn1 = ackley)
##D }
## End(Not run)

###########################################################
## applicative problem (with unknown objective function) ##
###########################################################
##   identify the initial set of experimental runs (initialization)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10)

## perform the experiments in \code{tn$xpop} and measure the response 
##	values, then load the measured response values in \code{tn$ypop}
tn$ypop <- ackley(tn$xpop)

##   identify the experimental runs during subsequent steps of the 
##	EMMA procedure
for(t in 1:(C-1))
{
  tn <- emmatn(t, tn, na = 5, opt = "mn", weight, pr.mut = pr.mut, 
	graph = "no")
  tn$ypop <- ackley(tn$xpop)
  tn <- emmacheck(tn, graph = "no")
  if(tn$add==1) tn$ypop <- ackley(tn$xpop)
}



