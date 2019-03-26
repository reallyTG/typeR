library(cusp)


### Name: plot.cusp
### Title: Graphical Diagnostic Display of Cusp Catastrophe Data Fit
### Aliases: plot.cusp
### Keywords: hplot models

### ** Examples

set.seed(20)
x1 = runif(150)
x2 = runif(150)
z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
data <- data.frame(x1, x2, z)
fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)
## Not run: 
##D plot(fit)
##D 
##D # just densities
##D layout(matrix(1:4,2))
##D plot(fit, what="densities")
## End(Not run)



