library(limSolve)


### Name: xranges
### Title: Calculates ranges of the unknowns of a linear inverse problem
### Aliases: xranges
### Keywords: algebra array optimize

### ** Examples

# Estimate the ranges in the Diet Composition of Mink
E <- rbind(Minkdiet$Prey, rep(1, 7))
F <- c(Minkdiet$Mink, 1)
(DC <- xranges(E, F, ispos = TRUE))

# The same, but explicitly imposing positivity
(DC <- xranges(E, F, G = diag(7), H = rep(0, 7)))




