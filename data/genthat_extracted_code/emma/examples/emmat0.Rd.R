library(emma)


### Name: emmat0
### Title: Defining the initial design
### Aliases: emmat0
### Keywords: ~Designed Experiments ~Optimization

### ** Examples

#########################
## 1 response variable ##
#########################
## define the problem variables
in.name <- c("x1","x2")
nlev <- c(20, 20)
lower <- c(-2.048, -2.048)
upper <- c(2.048, 2.048)
out.name <- "y"

## identify the initial set of experimental runs (initialization)
## simulated problem (with known objective function)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley)

## applicative problem (with unknown objective function)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10)
## perform the experiments in \code{tn$xpop} and measure the 
##	response values, then load in \code{tn$ypop} the measured 
##	response values 
# tn$ypop<-...


##########################
## 2 response variables ##
##########################
in.name <- c("x1", "x2")
nlev <- c(20, 20)
lower <- c(-3, -3)
upper <- c(3, 3)
out.name <- c("y1", "y2")
weight <- c(0.2, 0.8)
C <- 10
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley, 
	fn2 = peaks)




