library(copula)


### Name: archmCopula
### Title: Construction of Archimedean Copula Class Object
### Aliases: archmCopula claytonCopula frankCopula gumbelCopula amhCopula
###   joeCopula
### Keywords: distribution multivariate

### ** Examples

clayton.cop <- claytonCopula(2, dim = 3)
## scatterplot3d(rCopula(1000, clayton.cop))

## negative param (= theta) is allowed for dim = 2 :
tau(claytonCopula(-0.5)) ## = -1/3
tauClayton <- Vectorize(function(theta) tau(claytonCopula(theta, dim=2)))
plot(tauClayton, -1, 10, xlab=quote(theta), ylim = c(-1,1), n=1025)
abline(h=-1:1,v=0, col="#11111150", lty=2); axis(1, at=-1)

tauFrank <- Vectorize(function(theta) tau(frankCopula(theta, dim=2)))
plot(tauFrank, -40, 50, xlab=quote(theta), ylim = c(-1,1), n=1025)
abline(h=-1:1,v=0, col="#11111150", lty=2)

## tauAMH() is function in our package
iTau(amhCopula(), -1) # -1 with a range warning
iTau(amhCopula(), (5 - 8*log(2)) / 3) # -1 with a range warning

ic <- frankCopula(0) # independence copula (with a "message")
stopifnot(identical(ic,
   frankCopula(0, use.indepC = "TRUE")))# indep.copula  withOUT message
(fC <- frankCopula(0, use.indepC = "FALSE"))
## a Frank copula which corresponds to the indep.copula (but is not)

frankCopula(dim = 3)# with NA parameters
frank.cop <- frankCopula(3)# dim=2
persp(frank.cop, dCopula)

gumbel.cop <- archmCopula("gumbel", 5)
stopifnot(identical(gumbel.cop, gumbelCopula(5)))
contour(gumbel.cop, dCopula)

amh.cop <- amhCopula(0.5)
u. <- as.matrix(expand.grid(u=(0:10)/10, v=(0:10)/10, KEEP.OUT.ATTRS=FALSE))
du <- dCopula(u., amh.cop)
stopifnot(is.finite(du) | apply(u. == 0, 1,any)| apply(u. == 1, 1,any))

## A 7-dim Frank copula
frank.cop <- frankCopula(3, dim = 7)
x <- rCopula(5, frank.cop)
## dCopula now *does* work:
dCopula(x, frank.cop)

## A 7-dim Gumbel copula
gumbelC.7 <- gumbelCopula(2, dim = 7)
dCopula(x, gumbelC.7)

## A 12-dim Joe copula
joe.cop <- joeCopula(iTau(joeCopula(), 0.5), dim = 12)
x <- rCopula(5, joe.cop)
dCopula(x, joe.cop)



