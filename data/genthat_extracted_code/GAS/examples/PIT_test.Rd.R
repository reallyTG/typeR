library(GAS)


### Name: PIT_test
### Title: Goodness of fit for conditional densities
### Aliases: PIT_test

### ** Examples

data("StockIndices")

GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
                     GASPar = list(location = FALSE, scale = TRUE,
                                   shape = FALSE))

FTSEMIB = StockIndices[, "FTSEMIB"]

Fit = UniGASFit(GASSpec, FTSEMIB)

U = pit(Fit)

Test = PIT_test(U, G = 20, alpha = 0.05, plot = TRUE)



