library(copula)


### Name: ellipCopula
### Title: Construction of Elliptical Copula Class Objects
### Aliases: ellipCopula normalCopula tCopula
### Keywords: distribution multivariate

### ** Examples

norm.cop <- normalCopula(c(0.5, 0.6, 0.7), dim = 3, dispstr = "un")
t.cop <- tCopula(c(0.5, 0.3), dim = 3, dispstr = "toep",
                 df = 2, df.fixed = TRUE)
getSigma(t.cop) # P matrix (with diagonal = 1)

## dispersion "AR1" :
nC.7 <- normalCopula(0.8, dim = 7, dispstr = "ar1")
getSigma(nC.7) ##-> toeplitz( (1  0.8  0.8^2  0.8^3  ... 0.8^6) ) matrix

## from the wrapper
norm.cop <- ellipCopula("normal", param = c(0.5, 0.6, 0.7),
                        dim = 3, dispstr = "un")
if(require("scatterplot3d") && dev.interactive(orNone=TRUE)) {
  ## 3d scatter plot of 1000 random observations
  scatterplot3d(rCopula(1000, norm.cop))
  scatterplot3d(rCopula(1000, t.cop))
}
set.seed(12)
uN <- rCopula(512, norm.cop)
set.seed(2); pN1 <- pCopula(uN, norm.cop)
set.seed(3); pN2 <- pCopula(uN, norm.cop)
stopifnot(all.equal(pN1, pN2, 1e-4))# see 5.711e-5
(Xtras <- copula:::doExtras())
if(Xtras) { ## a bit more accurately:
  set.seed(4); pN1. <- pCopula(uN, norm.cop, abseps = 1e-9)
  set.seed(5); pN2. <- pCopula(uN, norm.cop, abseps = 1e-9)
  stopifnot(all.equal(pN1., pN2., 1e-5))# see 3.397e-6
  ## but increasing the required precision (e.g., abseps=1e-15) does *NOT* help
}

## For smaller copula dimension 'd', alternatives are available and
## non-random, see ?GenzBretz from package 'mvtnorm' :
require("mvtnorm")# -> GenzBretz(), Miva(), and TVPACK() are available
## Note that Miwa() would become very slow for dimensions 5, 6, ..
set.seed(4); pN1.M <- pCopula(uN, norm.cop, algorithm = Miwa(steps = 512))
set.seed(5); pN2.M <- pCopula(uN, norm.cop, algorithm = Miwa(steps = 512))
stopifnot(all.equal(pN1.M, pN2.M, tol= 1e-15))# *no* randomness
set.seed(4); pN1.T <- pCopula(uN, norm.cop, algorithm = TVPACK(abseps = 1e-10))
set.seed(5); pN2.T <- pCopula(uN, norm.cop, algorithm = TVPACK(abseps = 1e-14))
stopifnot(all.equal(pN1.T, pN2.T, tol= 1e-15))# *no* randomness (but no effect of 'abseps')


## Versions with unspecified parameters:
tCopula()
allEQ <- function(u,v) all.equal(u, v, tolerance=0)
stopifnot(allEQ(ellipCopula("norm"), normalCopula()),
          allEQ(ellipCopula("t"), tCopula()))
tCopula(dim=3)
tCopula(dim=4, df.fixed=TRUE)
tCopula(dim=5, disp = "toep", df.fixed=TRUE)
normalCopula(dim=4, disp = "un")



