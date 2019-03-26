library(factoextra)


### Name: fviz_hmfa
### Title: Visualize Hierarchical Multiple Factor Analysis
### Aliases: fviz_hmfa fviz_hmfa_ind fviz_hmfa_var fviz_hmfa_quali_biplot
###   fviz_hmfa

### ** Examples

# Hierarchical Multiple Factor Analysis
# ++++++++++++++++++++++++
# Install and load FactoMineR to compute MFA
# install.packages("FactoMineR")
library("FactoMineR")
data(wine)
hierar <- list(c(2,5,3,10,9,2), c(4,2))
res.hmfa <- HMFA(wine, H = hierar, type=c("n",rep("s",5)), graph = FALSE)

# Graph of individuals
# ++++++++++++++++++++
# Color of individuals: col.ind = "#2E9FDF"
# Use repel = TRUE to avoid overplotting (slow if many points)
fviz_hmfa_ind(res.hmfa, repel = TRUE, col.ind = "#2E9FDF")

# Color individuals by groups, add concentration ellipses
# Remove labels: label = "none".
# Change color palette to "jco". See ?ggpubr::ggpar
grp <- as.factor(wine[,1])
p <- fviz_hmfa_ind(res.hmfa, label="none", habillage=grp,
       addEllipses=TRUE, palette = "jco")
print(p)
 

# Graph of variables
# ++++++++++++++++++++++++++++++++++++++++
# Quantitative variables
fviz_hmfa_var(res.hmfa, "quanti.var")
# Graph of categorical variable categories
fviz_hmfa_var(res.hmfa, "quali.var")
# Groups of variables (correlation square)
fviz_hmfa_var(res.hmfa, "group")


# Biplot of categorical variable categories and individuals
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
fviz_hmfa_quali_biplot(res.hmfa)
    
# Graph of partial individuals (starplot)
# +++++++++++++++++++++++++++++++++++++++
fviz_hmfa_ind(res.hmfa, partial = "all", palette = "Dark2")
 




