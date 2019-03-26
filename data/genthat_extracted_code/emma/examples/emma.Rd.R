library(emma)


### Name: emma
### Title: Evolutionary Model-based Multiresponse Approach
### Aliases: emma
### Keywords: ~Designed Experiments ~Optimization

### ** Examples


#########################
## 1 response variable ##
#########################
in.name <- c("x1","x2")
nlev <- c(20, 20)
lower <- c(-2.048, -2.048)
upper <- c(2.048, 2.048)
out.name <- "y"
weight <- 1
C <- 10
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

emma(in.name, nlev, lower, upper, out.name, opt = "mn", nd = 10, na = 5, 
	weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, c1f = 0.5, c2i = 0.5, 
	c2f = 2.5, b = 5, pr.mut, graph = "yes", fn1 = ackley) 

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

emma(in.name, nlev, lower, upper, out.name, opt = c("mn", "mx"), nd = 10, 
	na = 5, weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, c1f = 0.5, 
	c2i = 0.5, c2f = 2.5, b = 5, pr.mut, graph = "yes", fn1 = ackley, 
	fn2 = peaks, nresp = 2)




