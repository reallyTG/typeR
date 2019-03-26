library(cusp)


### Name: oliva
### Title: Synthetic cusp data set
### Aliases: oliva
### Keywords: datasets

### ** Examples

data(oliva)
set.seed(121)
fit <- cusp(y ~ z1 + z2 - 1, 
	alpha ~ x1 + x2 + x3 - 1, ~ y1 + y2 + y3 + y4 - 1, 
	data = oliva, start = rnorm(9))
summary(fit)
## Not run: 
##D cusp3d(fit, B=5.25, n.surf=50, theta=150) 
##D # B modifies the range of beta (is set here to 5.25 to make 
##D # sure all points lie on the surface)
## End(Not run)



