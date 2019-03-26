library(factoextra)


### Name: get_hmfa
### Title: Extract the results for individuals/variables/group/partial axes
###   - HMFA
### Aliases: get_hmfa get_hmfa_ind get_hmfa_var get_hmfa_partial

### ** Examples

# Multiple Factor Analysis
# ++++++++++++++++++++++++
# Install and load FactoMineR to compute MFA
# install.packages("FactoMineR")
library("FactoMineR")
data(wine)
hierar <- list(c(2,5,3,10,9,2), c(4,2))
res.hmfa <- HMFA(wine, H = hierar, type=c("n",rep("s",5)), graph = FALSE)
 
 # Extract the results for qualitative variable categories
 var <- get_hmfa_var(res.hmfa, "quali.var")
 print(var)
 head(var$coord) # coordinates of qualitative variables
 head(var$cos2) # cos2 of qualitative variables
 head(var$contrib) # contributions of qualitative variables
 
 # Extract the results for individuals
 ind <- get_hmfa_ind(res.hmfa)
 print(ind)
 head(ind$coord) # coordinates of individuals
 head(ind$cos2) # cos2 of individuals
 head(ind$contrib) # contributions of individuals
 
 # You can also use the function get_hmfa()
 get_hmfa(res.hmfa, "ind") # Results for individuals
 get_hmfa(res.hmfa, "quali.var") # Results for qualitative variable categories
 



