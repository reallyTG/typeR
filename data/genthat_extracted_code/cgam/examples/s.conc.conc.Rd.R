library(cgam)


### Name: s.conc.conc
### Title: Specify a Doubly-Concave Shape-Restriction in a CGAM Formula
### Aliases: s.conc.conc
### Keywords: shape routine

### ** Examples

	# generate data
	n <- 200
	set.seed(123)
	x1 <- runif(n); x2 <- runif(n)
	y <- -(x1 - 1)^2 - (x2 - 3)^2 + rnorm(n)
   
    # regress y on x1 and x2 under the shape-restriction: "doubly-concave" 
    ans <- cgam(y ~ s.conc.conc(x1, x2), nsim = 0)
    # make a 3D plot of the constrained surface
    plotpersp(ans)



