library(gSEM)


### Name: sgSEMp2
### Title: Semi-supervised Generalized Structural Equation Modelling (gSEM)
###   - Principle 2
### Aliases: sgSEMp2

### ** Examples

# Using built-in dataset
data(acrylic)
ans <- sgSEMp2(acrylic)
ans$res.print
plot(ans)

## Not run: 
##D # Using simulated data
##D x4=runif(100,0,2)
##D x3=1+2.5*x4+rnorm(100,0,0.5)
##D x1=runif(100,1,4)
##D x2=-1-x1+x3+rnorm(100,0,0.3)
##D y=2+2*exp(x1/3)+(x2-1)^2-x3+rnorm(100,0,0.5)
##D # Check the pairwise plot 
##D sim=cbind(x4,y,x1,x2,x3)
##D pairs(sim)
##D ans <- sgSEMp2(as.data.frame(sim))
##D plot(ans)
## End(Not run)



