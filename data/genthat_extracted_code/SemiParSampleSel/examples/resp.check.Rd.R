library(SemiParSampleSel)


### Name: resp.check
### Title: Preliminary response diagnostics
### Aliases: resp.check

### ** Examples


library(SemiParSampleSel)

# Generating normal response with n = 2000
ys <- rnorm(2000, mean=3, sd=1)
resp.check(ys, margin = "N")

## Not run: 
##D 
##D # Generating gamma response with n = 2000
##D ys <- rgamma(2000, shape=2, rate=3)
##D resp.check(ys, margin = "G")
##D 
##D # Generating Poisson response with n = 2000
##D ys <- rPO(2000, mu=3)
##D resp.check(ys, margin = "P")
##D 
##D # Generating negative binomial response with n = 2000
##D ys <- rNBI(2000, mu=3, sigma=1)
##D resp.check(ys, margin = "NB")
##D 
## End(Not run)





