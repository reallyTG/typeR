library(ThreeWay)


### Name: LineCon
### Title: Middle point location
### Aliases: LineCon
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# T2-AB with 1 component for the A- and B-mode
FitBusT2AB11 <- T2funcrep(Bus, 7, 5, 37, 1, 1, 37, 0, 1e-6,1)$fp
# T2-AB with 2 components for the A-mode and 1 component for the B-mode
FitBusT2AB21 <- T2funcrep(Bus, 7, 5, 37, 2, 1, 37, 0, 1e-6, 1)$fp
# T2-AB with 1 component for the A-mode and 2 components for the B-mode
# T2-AB with 1 component for the A-mode and 2 components for the B-mode
# FitBusT2AB21>FitBusT2AB12
# T2-AB with 2 components for the A- and B-mode
FitBusT2AB22 <- T2funcrep(Bus, 7, 5, 37, 2, 2, 37, 0, 1e-6,1)$fp
# number of effective parameters n x r1 + m x r2 + r1 x r2 x p - r1^2 - r2^2
nepT2AB11 <- 47
nepT2AB21 <- 88
nepT2AB22 <- 164
ret <- LineCon(FitBusT2AB11, FitBusT2AB21, FitBusT2AB22, nepT2AB11, nepT2AB21, nepT2AB22)



