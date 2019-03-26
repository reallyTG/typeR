library(mcmc)


### Name: morph
### Title: Variable Transformation
### Aliases: morph morph.identity
### Keywords: misc

### ** Examples


# use an exponential transformation, centered at 100.
b1 <- morph(b=1, center=100)
# original log unnormalized density is from a t distribution with 3
# degrees of freedom, centered at 100.
lud.transformed <- b1$lud(function(x) dt(x - 100, df=3, log=TRUE))
d.transformed <- Vectorize(function(x) exp(lud.transformed(x)))
## Not run: 
##D curve(d.transformed, from=-3, to=3, ylab="Induced Density")
## End(Not run)



