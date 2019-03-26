library(lvnet)


### Name: lassoSelect
### Title: Update lvnatLasso results to select a different model
### Aliases: lassoSelect

### ** Examples

## Not run: 
##D # Load dataset:
##D library("lavaan")
##D data(HolzingerSwineford1939)
##D Data <- HolzingerSwineford1939[,7:15]
##D 
##D # Measurement model:
##D Lambda <- matrix(0, 9, 3)
##D Lambda[1:3,1] <- NA
##D Lambda[4:6,2] <- NA
##D Lambda[7:9,3] <- NA
##D 
##D # Search best fitting omega_theta:
##D res <- lvnetLasso(Data, "omega_theta", lambda = Lambda)
##D res$best
##D summary(res)
##D 
##D # Update to use EBIC:
##D resEBIC <- lassoSelect(res, ebic)
##D summary(resEBIC)
##D 
##D # Update to use minimal fitting model with RMSEA < 0.05:
##D resMinimal <- lassoSelect(res, df * (rmsea < 0.05), minimize = FALSE)
##D summary(resMinimal)
## End(Not run)



