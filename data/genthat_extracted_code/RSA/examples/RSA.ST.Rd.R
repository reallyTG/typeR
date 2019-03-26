library(RSA)


### Name: RSA.ST
### Title: Surface tests
### Aliases: RSA.ST

### ** Examples

# get surface parameters from known parameters
# example from Shanock et al. (2010), p. 548, Table 2
RSA.ST(x=-.23, y=.77, x2=-.07, y2=-.10, xy=.27)


## Compute standard errors and p values for surface parameters 
## from external regression coefficients:
# standard errors for coefficients
SE <- c(x=.09, y=.09, x2=.07, y2=.07, xy=.11)
# covariances for specific coefficients:
COV <- c(x_y= -.000, x2_y2 = .001, x2_xy = -.003, y2_xy = -.004)
RSA.ST(x = .131, y = .382, x2 = .074, xy = .002, y2 = .039, SE=SE, COV=COV, df=181)


# Get surface parameters from a computed RSA object
set.seed(0xBEEF)
n <- 300
err <- 2
x <- rnorm(n, 0, 5)
y <- rnorm(n, 0, 5)
df <- data.frame(x, y)
df <- within(df, {
	diff <- x-y
	absdiff <- abs(x-y)
	SD <- (x-y)^2
	z.diff <- diff + rnorm(n, 0, err)
	z.abs <- absdiff + rnorm(n, 0, err)
	z.sq <- SD + rnorm(n, 0, err)
	z.add <- diff + 0.4*x + rnorm(n, 0, err)
	z.complex <- 0.4*x + - 0.2*x*y + + 0.1*x^2 - 0.03*y^2 + rnorm(n, 0, err)
})

r1 <- RSA(z.sq~x*y, df, models="full")
RSA.ST(r1)



