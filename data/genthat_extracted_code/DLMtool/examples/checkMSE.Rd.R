library(DLMtool)


### Name: checkMSE
### Title: Utility functions for MSE objects
### Aliases: checkMSE joinMSE updateMSE

### ** Examples

# An example of joinMSE
## Not run: 
##D OM1 <- DLMtool::testOM
##D MSE1 <- runMSE(OM1) 
##D OM2 <- OM1 
##D OM2@seed <- OM1@seed + 1
##D MSE2 <- runMSE(OM2)
##D MSE <- joinMSE(list(MSE1, MSE2))
##D MSE@nsim
## End(Not run)



