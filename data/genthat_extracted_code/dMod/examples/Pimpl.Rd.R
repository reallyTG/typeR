library(dMod)


### Name: Pimpl
### Title: Parameter transformation (implicit)
### Aliases: Pimpl

### ** Examples

########################################################################
## Example 1: Steady-state trafo
########################################################################
f <- c(A = "-k1*A + k2*B",
       B = "k1*A - k2*B")
P.steadyState <- Pimpl(f, "A")

p.outerValues <- c(k1 = 1, k2 = 0.1, A = 10, B = 1)
P.steadyState(p.outerValues)

########################################################################
## Example 2: Steady-state trafo combined with log-transform
########################################################################
f <- c(A = "-k1*A + k2*B",
       B = "k1*A - k2*B")
P.steadyState <- Pimpl(f, "A")

logtrafo <- c(k1 = "exp(logk1)", k2 = "exp(logk2)", A = "exp(logA)", B = "exp(logB)")
P.log <- P(logtrafo)

p.outerValue <- c(logk1 = 1, logk2 = -1, logA = 0, logB = 0)
(P.log)(p.outerValue)
(P.steadyState * P.log)(p.outerValue)

########################################################################
## Example 3: Steady-states with conserved quantitites
########################################################################
f <- c(A = "-k1*A + k2*B", B = "k1*A - k2*B")
replacement <- c(B = "A + B - total")
f[names(replacement)] <- replacement

pSS <- Pimpl(f, "total")
pSS(c(k1 = 1, k2 = 2, A = 5, B = 5, total = 3))



