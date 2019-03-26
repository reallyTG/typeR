library(MMeM)


### Name: MMeM_henderson3
### Title: Multivariate Henderson3 method
### Aliases: MMeM_henderson3

### ** Examples

data(simdata)
results_henderson <- MMeM_henderson3(fml = c(V1,V2) ~ X_vec + (1|Z_vec),
data = simdata, factor_X = TRUE)




