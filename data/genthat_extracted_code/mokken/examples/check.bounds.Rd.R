library(mokken)


### Name: check.bounds
### Title: Check the relative lower bound for scalability coefficients
### Aliases: check.bounds
### Keywords: bounds

### ** Examples

data(acl)
Communality <- acl[,1:10]
R <- cor(Communality)
res <- check.bounds(Communality, upper = TRUE)
L1rij <- res$LowerBounds$L1rij
L2rij <- res$LowerBounds$L2rij
U1rij <- res$UpperBounds$U1rij
U2rij <- res$UpperBounds$U2rij
# Correlations that meet L1rij (possibly an overestimation of the lower bound). 
R >= L1rij 
# Correlations that meet U1rij (possibly an overestimation of the upper bound). 
R <= U1rij 
# Correlations that meet L2rij (possibly an underestimation of the lower bound). 
R >= L2rij 
# Correlations that meet U2rij (possibly an underestimation of the upper bound). 
R <= U2rij 



