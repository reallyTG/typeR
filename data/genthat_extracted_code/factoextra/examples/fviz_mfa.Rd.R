library(factoextra)


### Name: fviz_mfa
### Title: Visualize Multiple Factor Analysis
### Aliases: fviz_mfa fviz_mfa_ind fviz_mfa_quali_biplot fviz_mfa_var
###   fviz_mfa_axes fviz_mfa

### ** Examples

# Compute Multiple Factor Analysis
library("FactoMineR")
data(wine)
res.mfa <- MFA(wine, group=c(2,5,3,10,9,2), type=c("n",rep("s",5)),
               ncp=5, name.group=c("orig","olf","vis","olfag","gust","ens"),
               num.group.sup=c(1,6), graph=FALSE)
               
# Eigenvalues/variances of dimensions
fviz_screeplot(res.mfa)
# Group of variables
fviz_mfa_var(res.mfa, "group")
# Quantitative variables
fviz_mfa_var(res.mfa, "quanti.var", palette = "jco", 
  col.var.sup = "violet", repel = TRUE)
# Graph of individuals colored by cos2
fviz_mfa_ind(res.mfa, col.ind = "cos2", 
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE)
# Partial individuals
fviz_mfa_ind(res.mfa, partial = "all") 
# Partial axes
fviz_mfa_axes(res.mfa)


# Graph of categorical variable categories
# ++++++++++++++++++++++++++++++++++++++++
data(poison)
res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
               name.group=c("desc","desc2","symptom","eat"),
               num.group.sup=1:2, graph=FALSE)

# Plot of qualitative variables
fviz_mfa_var(res.mfa, "quali.var")
 
 

# Biplot of categorical variable categories and individuals
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # Use repel = TRUE to avoid overplotting
grp <- as.factor(poison[, "Vomiting"])
fviz_mfa_quali_biplot(res.mfa, repel = FALSE, col.var = "#E7B800",
   habillage = grp, addEllipses = TRUE, ellipse.level = 0.95)




