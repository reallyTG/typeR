library(locits)


### Name: mkcoef
### Title: Compute discrete wavelets.
### Aliases: mkcoef
### Keywords: algebra

### ** Examples

#
# E.g. compute discrete Haar wavelets on scales 1, 2, 3.
#
mkcoef(-3, 1, "DaubExPhase")
#[[1]]
#[1]  0.7071068 -0.7071068
#
#[[2]]
#[1]  0.5  0.5 -0.5 -0.5
#
#[[3]]
#[1]  0.3535534  0.3535534  0.3535534  0.3535534 -0.3535534 -0.3535534 -0.3535534
#[8] -0.3535534



