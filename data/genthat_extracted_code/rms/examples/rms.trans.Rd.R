library(rms)


### Name: rms.trans
### Title: rms Special Transformation Functions
### Aliases: rms.trans asis pol lsp rcs catg scored strat matrx %ia%
### Keywords: models regression math manip methods survival smooth

### ** Examples

## Not run: 
##D options(knots=4, poly.degree=2)
##D # To get the old behavior of rcspline.eval knot placement (which didnt' handle
##D # clumping at the lowest or highest value of the predictor very well):
##D # options(fractied = 1.0)   # see rcspline.eval for details
##D country <- factor(country.codes)
##D blood.pressure <- cbind(sbp=systolic.bp, dbp=diastolic.bp)
##D fit <- lrm(Y ~ sqrt(x1)*rcs(x2) + rcs(x3,c(5,10,15)) + 
##D        lsp(x4,c(10,20)) + country + blood.pressure + poly(age,2))
##D # sqrt(x1) is an implicit asis variable, but limits of x1, not sqrt(x1)
##D #       are used for later plotting and effect estimation
##D # x2 fitted with restricted cubic spline with 4 default knots
##D # x3 fitted with r.c.s. with 3 specified knots
##D # x4 fitted with linear spline with 2 specified knots
##D # country is an implied catg variable
##D # blood.pressure is an implied matrx variable
##D # since poly is not an rms function (pol is), it creates a
##D #       matrx type variable with no automatic linearity testing
##D #       or plotting
##D f1 <- lrm(y ~ rcs(x1) + rcs(x2) + rcs(x1) %ia% rcs(x2))
##D # %ia% restricts interactions. Here it removes terms nonlinear in
##D # both x1 and x2
##D f2 <- lrm(y ~ rcs(x1) + rcs(x2) + x1 %ia% rcs(x2))
##D # interaction linear in x1
##D f3 <- lrm(y ~ rcs(x1) + rcs(x2) + x1 %ia% x2)
##D # simple product interaction (doubly linear)
##D # Use x1 %ia% x2 instead of x1:x2 because x1 %ia% x2 triggers
##D # anova to pool x1*x2 term into x1 terms to test total effect
##D # of x1
## End(Not run)



