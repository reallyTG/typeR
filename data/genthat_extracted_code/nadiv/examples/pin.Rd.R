library(nadiv)


### Name: pin
### Title: Approximate standard errors for linear functions of variance
###   components
### Aliases: pin

### ** Examples


# Below is the heritability calculation for tait1 of the warcolak dataset
# Re-create the output from a basic, univariate animal model in asreml-R
   asrMod <- list(gammas = c(0.6383285, 1.00),
	gammas.type = c(2, 1),
	ai = c(0.0044461106, -0.0011754947, 0.0004424668))
   namevec <- c("ped(ID)!ped", "R!variance")
   names(asrMod[[1]]) <- names(asrMod[[2]]) <- namevec

   nadiv:::pin(asrMod, h2 ~ V1 / (V1 + V2))



