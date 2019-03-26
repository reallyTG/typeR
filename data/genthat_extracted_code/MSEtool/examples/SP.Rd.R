library(MSEtool)


### Name: SP
### Title: Surplus production model with UMSY and MSY as leading parameters
### Aliases: SP SP_SS

### ** Examples

## No test: 
data(swordfish)

#### Observation-error surplus production model
res <- SP(Data = swordfish)

# Provide starting values, assume B/K = 0.95 in first year of model
# and symmetrical production curve (n = 2)
start <- list(UMSY = 0.1, MSY = 1e5, dep = 0.95, n = 2)
res <- SP(Data = swordfish, start = start)

#### State-space version
res <- SP_SS(Data = swordfish, start = list(dep = 0.95, tau = 0.3),
fix_sigma = TRUE)
## End(No test)



