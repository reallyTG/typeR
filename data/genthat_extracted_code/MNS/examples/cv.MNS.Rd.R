library(MNS)


### Name: cv.MNS
### Title: Select regularization parameters via cross-validation
### Aliases: cv.MNS
### Keywords: cross-validation

### ** Examples

set.seed(1)
Dat = gen.Network(p = 10, Nsub = 5, 
 sparsity = .2, REsize=10, REprob=.5, 
 REnoise = 1, Nobs=20)
## Not run: 
##D CVs = cv.MNS(dat = Dat, l1range = seq(.1, .5, length.out=10),
##D  alpharange = seq(.2, .8, length.out = 5), 
##D  parallel = FALSE, verbose = TRUE)
## End(Not run)



