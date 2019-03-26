library(lvnet)


### Name: lvnetSearch
### Title: Step-wise exploratory search for optimal fitting model
### Aliases: lvnetSearch

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

# Search best fitting omega_psi:
## Not run: 
##D res <- lvnetSearch(Data, "omega_psi", lambda = Lambda)
##D res$best
## End(Not run)



