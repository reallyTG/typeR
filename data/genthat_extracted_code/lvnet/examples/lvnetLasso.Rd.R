library(lvnet)


### Name: lvnetLasso
### Title: LASSO model selection
### Aliases: lvnetLasso

### ** Examples

# Load dataset:
library("lavaan")
data(HolzingerSwineford1939)
Data <- HolzingerSwineford1939[,7:15]

# Measurement model:
Lambda <- matrix(0, 9, 3)
Lambda[1:3,1] <- NA
Lambda[4:6,2] <- NA
Lambda[7:9,3] <- NA

# Search best fitting omega_theta:
## Not run: 
##D res <- lvnetLasso(Data, "omega_theta", lambda = Lambda)
##D res$best
##D summary(res)
## End(Not run)



