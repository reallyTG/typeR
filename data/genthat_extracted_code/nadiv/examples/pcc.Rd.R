library(nadiv)


### Name: pcc
### Title: REML convergence checks
### Aliases: pcc

### ** Examples


# Below is the last 3 iterations from the trace from an animal model of 
# tait1 of the warcolak dataset.
# Re-create the output from a basic, univariate animal model in asreml-R
   tracein <- matrix(c(0.6387006, 1, 0.6383099, 1, 0.6383294, 1, 0.6383285, 1),
	nrow = 2, ncol = 4, byrow = FALSE)
   dimnames(tracein) <- list(c("ped(ID)!ped", "R!variance"), c(6, 7, 8, 9))

   pcc(object = NULL, trace = tracein)





