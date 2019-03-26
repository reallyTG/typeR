library(limSolve)


### Name: varranges
### Title: Calculates ranges of inverse variables in a linear inverse
###   problem
### Aliases: varranges
### Keywords: algebra array optimize

### ** Examples

# Ranges in the contribution of food 3+4+5 in the diet of Mink (try ?Minkdiet)

E     <- rbind(Minkdiet$Prey, rep(1, 7))
F     <- c(Minkdiet$Mink, 1)
EqA   <- c(0, 0, 1, 1, 1, 0, 0)                    # sum of food 3,4,5
(isoA <- varranges(E, F, EqA = EqA, ispos = TRUE)) # ranges of part of food 3+4+5

# The same, but explicitly imposing positivity
varranges(E, F, EqA = EqA, G = diag(7), H = rep(0, 7)) 



