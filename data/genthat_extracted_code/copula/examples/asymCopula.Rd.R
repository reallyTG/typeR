library(copula)


### Name: khoudrajiCopula
### Title: Construction of copulas using Khoudraji's device
### Aliases: khoudrajiCopula asymCopula asymExplicitCopula
### Keywords: distribution multivariate

### ** Examples

## A bivariate Khoudraji-Clayton copula
kc <- khoudrajiCopula(copula2 = claytonCopula(6),
                      shapes = c(0.4, 0.95))
class(kc) # "kh..._Biv_Copula"
kc
contour(kc, dCopula, nlevels = 20, main = "dCopula(<khoudrajiBivCopula>)")

## A Khoudraji-Clayton copula with second shape parameter fixed
kcf <- khoudrajiCopula(copula2 = claytonCopula(6),
                       shapes = fixParam(c(0.4, 0.95), c(FALSE, TRUE)))
kcf. <- setTheta(kcf, c(3, 0.2)) # (change *free* param's only)
validObject(kcf) & validObject(kcf.)

## A "nested" Khoudraji bivariate copula
kgkcf <- khoudrajiCopula(copula1 = gumbelCopula(3),
                         copula2 = kcf,
                         shapes = c(0.7, 0.25))
kgkcf # -> 6 parameters (1 of 6 is 'fixed')
contour(kgkcf, dCopula, nlevels = 20,
        main = "dCopula(<khoudrajiBivC.(nested)>)")

(Xtras <- copula:::doExtras()) # determine whether examples will be extra (long)
n <- if(Xtras) 300 else 64 # sample size (realistic vs short for example)
## Don't show: 
set.seed(47)
## End(Don't show)
u <- rCopula(n, kc)
plot(u)

## For likelihood (or fitting), specify the "free" (non-fixed) param's:
##           C1:  C2c C2s1    sh1  sh2
loglikCopula(c(3,   6, 0.4,   0.7, 0.25),
             u = u, copula = kgkcf)

## Fitting takes time (using numerical differentiation) and may be difficult:

## Starting values are required for all parameters
f.IC <- fitCopula(khoudrajiCopula(copula2 = claytonCopula()),
                  start = c(1.1, 0.5, 0.5), data = pobs(u),
                  optim.method = "Nelder-Mead")
summary(f.IC)
confint(f.IC) # (only interesting for reasonable sample size)

## Because of time,  don't run these by default :
## No test: 
## Second shape parameter fixed to 0.95
kcf2 <- khoudrajiCopula(copula2 = claytonCopula(),
                        shapes = fixParam(c(NA_real_, 0.95), c(FALSE, TRUE)))
system.time(
f.ICf <- fitCopula(kcf2, start = c(1.1, 0.5), data = pobs(u),
                   optim.method = "Nelder-Mead")
) # ~ 7-8 sec
confint(f.ICf) # !
coef(f.ICf, SE=TRUE)

## With a different optimization method
system.time(
f.IC2 <- fitCopula(kcf2, start = c(1.1, 0.5), data = pobs(u),
                   optim.method = "BFGS")
)
printCoefmat(coef(f.IC2, SE=TRUE), digits = 3) # w/o unuseful extra digits


if(Xtras >= 2) { # really S..L..O..W... --------

## GOF example
optim.method <- "Nelder-Mead" #try "BFGS" as well
gofCopula(kcf2, x = u, start = c(1.1, 0.5), optim.method = optim.method)
gofCopula(kcf2, x = u, start = c(1.1, 0.5), optim.method = optim.method,
          sim = "mult")
## The goodness-of-fit tests should hold their level
## but this would need to be tested

## Another example under the alternative
u <- rCopula(n, gumbelCopula(4))
gofCopula(kcf2, x = u, start = c(1.1, 0.5), optim.method = optim.method)
gofCopula(kcf2, x = u, start = c(1.1, 0.5), optim.method = optim.method,
          sim = "mult")

}## ------ end { really slow gofC*() } --------

## Higher-dimensional constructions

## A three dimensional Khoudraji-Clayton copula
kcd3 <- khoudrajiCopula(copula1 = indepCopula(dim=3),
                        copula2 = claytonCopula(6, dim=3),
                        shapes = c(0.4, 0.95, 0.95))

n <- if(Xtras) 1000 else 100 # sample size (realistic vs short for example)
u <- rCopula(n, kcd3)
splom2(u)
v <- matrix(runif(15), 5, 3)
dCopula(v, kcd3)

## A four dimensional Khoudraji-Normal copula
knd4 <- khoudrajiCopula(copula1 = indepCopula(dim=4),
                        copula2 = normalCopula(.9, dim=4),
                        shapes = c(0.4, 0.95, 0.95, 0.95))
knd4
stopifnot(class(knd4) == "khoudrajiCopula")
u <- rCopula(n, knd4)
splom2(u)
## TODO :
## dCopula(v, knd4) ## not implemented
## End(No test)



