library(strandCet)


### Name: HP.priors
### Title: Heligman-Pollard Parameter prior formation.
### Aliases: HP.priors
### Keywords: Heligman-Pollard bycatch mortality priors

### ** Examples


priors <- data.frame(priors.lo = c(0,0.5,0,0,0,0,6,0,1),
                     priors.hi = c(0.1,1,1,0.15,0.15,50,10,0.01,1.5))

HP.priors(pri.lo = priors$priors.lo,
          pri.hi = priors$priors.hi,
          theta.dim = 9)




