library(R2BayesX)


### Name: bayesx.construct
### Title: Construct BayesX Model Term Objects
### Aliases: bayesx.construct bayesx.construct.bl.smooth.construct
###   bayesx.construct.gk.smooth.construct
###   bayesx.construct.gs.smooth.construct
###   bayesx.construct.mrf.smooth.construct
###   bayesx.construct.ps.smooth.construct
###   bayesx.construct.ra.smooth.construct
###   bayesx.construct.re.smooth.construct
###   bayesx.construct.rw1.smooth.construct
###   bayesx.construct.rw2.smooth.construct
###   bayesx.construct.tensor.smooth.construct
###   bayesx.construct.te.smooth.construct
###   bayesx.construct.lasso.smooth.construct
###   bayesx.construct.ridge.smooth.construct
###   bayesx.construct.nigmix.smooth.construct
###   bayesx.construct.kr.smooth.construct
###   bayesx.construct.season.smooth.construct
###   bayesx.construct.factor.smooth.construct
### Keywords: regression

### ** Examples

bayesx.construct(sx(x1, bs = "ps"))
bayesx.construct(sx(x1, x2, bs = "te"))

## now create BayesX syntax for smooth terms
## using mgcv constructor functions
bayesx.construct(s(x1, bs = "ps"))

## for tensor product P-splines,
bayesx.construct(s(x1, x2, bs = "te"))

## increase number of knots
## for a P-spline
bayesx.construct(sx(x1, bs = "ps", nrknots = 40))

## now with degree 2 and
## penalty order 1
bayesx.construct(sx(x1, bs = "ps", knots = 40, degree = 2, order = 1))
bayesx.construct(s(x1, bs = "ps", k = 41, m = c(0, 1)))

## random walks
bayesx.construct(sx(x1, bs = "rw1"))
bayesx.construct(sx(x1, bs = "rw2"))

## shrinkage priors
bayesx.construct(sx(x1, bs = "lasso"))
bayesx.construct(sx(x1, bs = "ridge"))
bayesx.construct(sx(x1, bs = "nigmix"))

## for cox models, baseline
bayesx.construct(sx(time, bs = "bl"))

## kriging
bayesx.construct(sx(x, z, bs = "kr"))

## seasonal
bayesx.construct(sx(x, bs = "season"))

## factors
bayesx.construct(sx(id, bs = "factor"))

## now with some geographical information
## note: maps must be either supplied in
## 'bnd' or 'gra' format, also see function
## read.bnd() or read.gra()
data("MunichBnd")
bayesx.construct(sx(id, bs = "mrf", map = MunichBnd))

## same with
bayesx.construct(s(id, bs = "mrf", xt = list(map = MunichBnd)))

bayesx.construct(sx(id, bs = "gk", map = MunichBnd))
bayesx.construct(sx(id, bs = "gs", map = MunichBnd))

## also vary number of knots
bayesx.construct(sx(id, bs = "gs", knots = 10, map = MunichBnd))
bayesx.construct(s(id, bs = "gs", k = 12, m = c(1, 1), xt = list(map = MunichBnd)))

## random effects
bayesx.construct(sx(id, bs = "re"))
bayesx.construct(sx(id, bs = "re", by = x1))
bayesx.construct(sx(id, bs = "re", by = x1, xt = list(nofixed=TRUE)))

## generic
## specifies some model term
## and sets all additional arguments 
## within argument xt
## only for experimental use
bayesx.construct(sx(x, bs = "generic", dosomething = TRUE, a = 1, b = 2))



