library(aster)


### Name: pickle
### Title: Penalized Quasi-Likelihood for Aster Models
### Aliases: pickle pickle1 pickle2 pickle3 makezwz
### Keywords: misc

### ** Examples

data(radish)

pred <- c(0,1,2)
fam <- c(1,3,2)

### need object of type aster to supply to penmlogl and pickle

aout <- aster(resp ~ varb + fit : (Site * Region + Block + Pop),
    pred, fam, varb, id, root, data = radish)

### model matrices for fixed and random effects

modmat.fix <- model.matrix(resp ~ varb + fit : (Site * Region),
    data = radish)
modmat.blk <- model.matrix(resp ~ 0 + fit:Block, data = radish)
modmat.pop <- model.matrix(resp ~ 0 + fit:Pop, data = radish)

rownames(modmat.fix) <- NULL
rownames(modmat.blk) <- NULL
rownames(modmat.pop) <- NULL

idrop <- match(aout$dropped, colnames(modmat.fix))
idrop <- idrop[! is.na(idrop)]
modmat.fix <- modmat.fix[ , - idrop]

nfix <- ncol(modmat.fix)
nblk <- ncol(modmat.blk)
npop <- ncol(modmat.pop)

### try penmlogl

sigma.start <- c(1, 1)

alpha.start <- aout$coefficients[match(colnames(modmat.fix),
    names(aout$coefficients))]
parm.start <- c(alpha.start, rep(0, nblk + npop))

tout <- trust(objfun = penmlogl, parm.start, rinit = 1, rmax = 10,
    sigma = sigma.start, fixed = modmat.fix,
    random = list(modmat.blk, modmat.pop), obj = aout)
tout$converged

### crude estimate of variance components

eff.blk <- tout$argument[seq(nfix + 1, nfix + nblk)]
eff.pop <- tout$argument[seq(nfix + nblk + 1, nfix + nblk + npop)]
sigma.crude <- sqrt(c(var(eff.blk), var(eff.pop)))

### try optim and pickle

cache <- new.env(parent = emptyenv())
oout <- optim(sigma.crude, pickle, parm = tout$argument,
    fixed = modmat.fix, random = list(modmat.blk, modmat.pop),
    obj = aout, cache = cache)
oout$convergence == 0
### estimated variance components
oout$par^2

### get estimates of fixed and random effects

tout <- trust(objfun = penmlogl, tout$argument, rinit = 1, rmax = 10,
    sigma = oout$par, fixed = modmat.fix,
    random = list(modmat.blk, modmat.pop), obj = aout, fterm = 0)
tout$converged

sigma.better <- oout$par
alpha.better <- tout$argument[1:nfix]
c.better <- tout$argument[- (1:nfix)]
zwz.better <- makezwz(sigma.better, parm = c(alpha.better, c.better),
    fixed = modmat.fix, random = list(modmat.blk, modmat.pop), obj = aout)

### get better estimates

objfun <- function(alphaceesigma, zwz)
    pickle3(alphaceesigma, fixed = modmat.fix,
    random = list(modmat.blk, modmat.pop), obj = aout, zwz = zwz, deriv = 2)
tout <- trust(objfun, c(alpha.better, c.better, sigma.better),
    rinit = 1, rmax = 10, zwz = zwz.better)
tout$converged
alpha.mle <- tout$argument[1:nfix]
c.mle <- tout$argument[nfix + 1:(nblk + npop)]
sigma.mle <- tout$argument[nfix + nblk + npop + 1:2]
zwz.mle <- makezwz(sigma.mle, parm = c(alpha.mle, c.mle),
    fixed = modmat.fix, random = list(modmat.blk, modmat.pop), obj = aout)
### estimated variance components
sigma.mle^2

### preceding step can be iterated "until convergence"

### get (approximate) Fisher information

objfun <- function(alphasigma) pickle2(alphasigma, parm = c.mle,
    fixed = modmat.fix, random = list(modmat.blk, modmat.pop),
    obj = aout, zwz = zwz.mle)$value
gradfun <- function(alphasigma) pickle2(alphasigma, parm = c.mle,
    fixed = modmat.fix, random = list(modmat.blk, modmat.pop),
    obj = aout, zwz = zwz.mle, deriv = 1)$gradient
oout <- optim(c(alpha.mle, sigma.mle), objfun, gradfun, method = "BFGS",
    hessian = TRUE)
oout$convergence == 0
fish <- oout$hessian



