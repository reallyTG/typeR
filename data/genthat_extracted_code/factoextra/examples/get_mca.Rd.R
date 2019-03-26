library(factoextra)


### Name: get_mca
### Title: Extract the results for individuals/variables - MCA
### Aliases: get_mca get_mca_var get_mca_ind

### ** Examples

## No test: 
# Multiple Correspondence Analysis
# ++++++++++++++++++++++++++++++
# Install and load FactoMineR to compute MCA
# install.packages("FactoMineR")
library("FactoMineR")
data(poison)
poison.active <- poison[1:55, 5:15]
head(poison.active[, 1:6])
res.mca <- MCA(poison.active, graph=FALSE)
 
 # Extract the results for variable categories
 var <- get_mca_var(res.mca)
 print(var)
 head(var$coord) # coordinates of variables
 head(var$cos2) # cos2 of variables
 head(var$contrib) # contributions of variables
 
 # Extract the results for individuals
 ind <- get_mca_ind(res.mca)
 print(ind)
 head(ind$coord) # coordinates of individuals
 head(ind$cos2) # cos2 of individuals
 head(ind$contrib) # contributions of individuals
 
 # You can also use the function get_mca()
 get_mca(res.mca, "ind") # Results for individuals
 get_mca(res.mca, "var") # Results for variable categories
 
## End(No test)
 



