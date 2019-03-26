library(polychaosbasics)


### Name: polychaosbasics-package
### Title: Sensitivity Indexes Calculated from Polynomial Chaos Expansions
### Aliases: polychaosbasics-package polychaosbasics
### Keywords: package regression

### ** Examples

# First example:
# the dataset is simulated by using the Ishigami function 
nlhs <- 200 # number of rows
degree <- 6 # polynomial degree
set.seed(42)# fix the seed for reproductible results
pce <- analyticsPolyLeg(nlhs, degree, 'ishigami') # build Legendre polynomial
ret <- PCESI(pce) # compute the PCE sensitivity indexes
print(ret)
# Illustrate the result by a plot:
# plot the computer model output against the metamodel output
y.hat <- ret@y.hat   # metamodel output
y.obs <- pce[, "Y"] # computer model output
## Not run: 
##D X11() 
##D plot(y.hat, y.obs,
##D       xlab="metamodel output", ylab="computer model output",
##D       main="Ishigami test", sub="Scatter plot and regression line")
##D # Add the regression line
##D reg <- lm(y.hat ~ y.obs) # linear regression
##D lines(reg$fitted.values, y.obs)
## End(Not run)

# Second example:
# the dataset is a user dataset
load(system.file("extdata", "FLORSYS1extract.Rda",
   package="polychaosbasics"))
degree <- 4 # polynomial degree
lhs <- FLORSYS1extract[, -ncol(FLORSYS1extract)] # inputs
Y <- FLORSYS1extract[,ncol(FLORSYS1extract)] #  output 
pce <- polyLeg(lhs, Y, degree) # build Legendre polynomial
ret <- PCESI(pce) # compute the PCE sensitivity indexes
print(ret, all=TRUE)



