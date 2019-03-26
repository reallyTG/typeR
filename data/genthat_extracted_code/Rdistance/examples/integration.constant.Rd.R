library(Rdistance)


### Name: integration.constant
### Title: Compute the integration constant for distance density functions
### Aliases: integration.constant
### Keywords: models

### ** Examples

# Can put any number for first argument (1 used here)
scl <- integration.constant(dist=1, density=uniform.like, covars = NULL,
                            pointSurvey = FALSE, w.lo=0, w.hi = 100,
                            expansions = 0, a=c(75,25))
print(scl) # Should be 75.1

x <- seq(0,100,length=200)
y <- uniform.like( c(75,25), x, scale=FALSE ) / scl
int.y <- (x[2]-x[1]) * sum(y[-length(y)]+y[-1]) / 2  # the trapezoid rule, should be 1.0
print(int.y) # Should be 1




