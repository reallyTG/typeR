library(copula)


### Name: copFamilies
### Title: Specific Archimedean Copula Families ("acopula" Objects)
### Aliases: acopula-families copAMH copClayton copFrank copGumbel copJoe
### Keywords: datasets

### ** Examples

## Print a copAMH object and its structure
copAMH
str(copAMH)

## Show admissible parameters for a Clayton copula
copClayton@paraInterval

## Generate random variates from a Log(p) distribution via V0 of Frank
p <- 1/2
copFrank@V0(100, -log(1-p))

## Plot the upper tail-dependence coefficient as a function in the
## parameter for Gumbel's family
curve(copGumbel@lambdaU(x), xlim = c(1, 10), ylim = c(0,1), col = 4)

## Plot Kendall's tau as a function in the parameter for Joe's family
curve(copJoe@tau(x), xlim = c(1, 10), ylim = c(0,1), col = 4)

## ------- Plot psi() and tau() - and properties of all families ----

## The copula families currently provided:
(famNms <- ls("package:copula", patt="^cop[A-Z]"))

op <- par(mfrow= c(length(famNms), 2),
          mar = .6+ c(2,1.4,1,1), mgp = c(1.1, 0.4, 0))
for(nm in famNms) { Cf <- get(nm)
   thet <- Cf@iTau(0.3)
   curve(Cf@psi(x, theta = thet), 0, 5,
         xlab = quote(x), ylab="", ylim=0:1, col = 2,
         main = substitute(list(NAM ~~~ psi(x, theta == TH), tau == 0.3),
                           list(NAM=Cf@name, TH=thet)))
   I <- Cf@paraInterval
   Iu <- pmin(10, I[2])
   curve(Cf@tau(x), I[1], Iu, col = 3,
         xlab = bquote(theta %in% .(format(I))), ylab = "",
         main = substitute(NAM ~~ tau(theta), list(NAM=Cf@name)))
}
par(op)

## Construct a bivariate Clayton copula with parameter theta
theta <- 2
C2 <- onacopula("Clayton", C(theta, 1:2))
C2@copula # is an "acopula" with specific parameter theta

curve(C2@copula@psi(x, C2@copula@theta),
      main = quote("Generator" ~~ psi ~~ " of Clayton A.copula"),
      xlab = quote(theta1), ylab = quote(psi(theta1)),
      xlim = c(0,5), ylim = c(0,1), col = 4)

## What is the corresponding Kendall's tau?
C2@copula@tau(theta) # 0.5

## What are the corresponding tail-dependence coefficients?
C2@copula@lambdaL(theta)
C2@copula@lambdaU(theta)

## Generate n pairs of random variates from this copula
U <- rnacopula(n = 1000, C2)
## and plot the generated pairs of random variates
plot(U, asp=1, main = "n = 1000 from  Clayton(theta = 2)")



