library(emma)


### Name: emmatn
### Title: Defining the additional experimental points
### Aliases: emmatn
### Keywords: ~Designed Experiments ~Optimization

### ** Examples

## Not run: 
##D #########################
##D ## 1 response variable ##
##D #########################
##D 
##D in.name <- c("x1","x2")
##D nlev <- c(20, 20)
##D lower <- c(-2.048, -2.048)
##D upper <- c(2.048, 2.048)
##D out.name <- "y"
##D weight <- 1
##D C <- 10
##D pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))
##D 
##D ## simulated problem (with known objective function)
##D tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley)
##D 
##D for(t in 1:(C-1))
##D {
##D   tn <- emmatn(t, tn, na = 5, opt = "mn", weight, pr.mut = pr.mut, 
##D 	graph = "yes", fn1 = ackley)
##D   tn <- emmacheck(tn, graph = "no", fn1 = ackley)
##D }
##D 
##D 
##D ## applicative problem (with unknown objective function)
##D tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10)
##D ## use the measured response values to manually fill 'tn$ypop'
##D tn$ypop<-ackley(tn$xpop)
##D 
##D   for(t in 1:(C-1))
##D   {
##D     tn <- emmatn(t, tn, na = 5, opt = "mn", weight, pr.mut = pr.mut, 
##D 	graph = "yes")
##D     tn$ypop <- ackley(tn$xpop)
##D     tn <- emmacheck(tn, graph = "no")
##D     if(tn$add == 1) tn$ypop<-ackley(tn$xpop)
##D   }
## End(Not run)

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

for(t in 1:(C-1))
  {
    tn <- emmatn(t, tn, na = 5, opt = c("mn", "mx"), weight, 
	pr.mut = pr.mut, graph = "yes", fn1 = ackley, fn2 = peaks)
    tn <- emmacheck(tn, graph = "no", fn1 = ackley, fn2 = peaks)
  }



