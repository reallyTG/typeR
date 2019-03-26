library(RSA)


### Name: RSA
### Title: Performs several RSA model tests on a data set with two
###   predictors
### Aliases: RSA

### ** Examples

# Compute response surface from a fake data set
set.seed(0xBEEF)
n <- 300
err <- 15
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
## Not run: 
##D r1 <- RSA(z.sq~x*y, df)
##D summary(r1)
##D compare(r1)
##D plot(r1)
##D plot(r1, model="SRSQD")
##D plot(r1, model="full", type="c")
##D getPar(r1, "coef")	# print model parameters including SE and CI
##D RSA.ST(r1)	# get surface parameters
##D 
##D # Motive congruency example
##D data(motcon)
##D r.m <- RSA(postVA~ePow*iPow, motcon)
##D 
##D # Get boostrapped CIs with 10 bootstrap samples (usually this should be set to 5000 or higher),
##D # only from the SSQD model
##D c1 <- confint(r.m, model="SSQD", method="boot", R=10)
##D 
##D # Plot the final model
##D plot(r.m, model="RR", xlab="Explicit power motive", 
##D 		ylab="Implicit power motive", zlab="Affective valence")
## End(Not run)



