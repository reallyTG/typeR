library(factoextra)


### Name: get_mfa
### Title: Extract the results for individuals/variables/group/partial axes
###   - MFA
### Aliases: get_mfa get_mfa_ind get_mfa_var get_mfa_partial_axes

### ** Examples

# Multiple Factor Analysis
# ++++++++++++++++++++++++
# Install and load FactoMineR to compute MFA
# install.packages("FactoMineR")
library("FactoMineR")
data(poison)
res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
name.group=c("desc","desc2","symptom","eat"), num.group.sup=1:2,
graph = FALSE)
 
 # Extract the results for qualitative variable categories
 var <- get_mfa_var(res.mfa, "quali.var")
 print(var)
 head(var$coord) # coordinates of qualitative variables
 head(var$cos2) # cos2 of qualitative variables
 head(var$contrib) # contributions of qualitative variables
 
 # Extract the results for individuals
 ind <- get_mfa_ind(res.mfa)
 print(ind)
 head(ind$coord) # coordinates of individuals
 head(ind$cos2) # cos2 of individuals
 head(ind$contrib) # contributions of individuals
 
 # You can also use the function get_mfa()
 get_mfa(res.mfa, "ind") # Results for individuals
 get_mfa(res.mfa, "quali.var") # Results for qualitative variable categories
 



