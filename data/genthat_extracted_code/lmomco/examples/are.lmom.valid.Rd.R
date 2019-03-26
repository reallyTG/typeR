library(lmomco)


### Name: are.lmom.valid
### Title: Are the L-moments valid
### Aliases: are.lmom.valid
### Keywords: L-moment (theoretical) L-moment (validation)

### ** Examples

lmr <- lmoms(rnorm(20))
if(are.lmom.valid(lmr)) print("They are.")
## Not run: 
##D X <- c(1.7106278,  1.7598761,  1.2111335,  0.3447490,  1.8312889,
##D        1.3938445, -0.5376054, -0.2341009, -0.4333601, -0.2545229)
##D are.lmom.valid(lmoms(X))
##D are.lmom.valid(pwm2lmom(pwm.pp(X, a=0.5)))
##D 
##D # Prior to version 2.2.6, the next line could leak through as TRUE. This was a problem.
##D # Nonfiniteness of the mean or L-scale should have been checked; they are for v2.2.6+
##D are.lmom.valid(lmoms(log10(c(1,23,235,652,0)), nmom=1)) # of other nmom
## End(Not run)



