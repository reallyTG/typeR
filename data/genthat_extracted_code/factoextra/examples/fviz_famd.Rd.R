library(factoextra)


### Name: fviz_famd
### Title: Visualize Factor Analysis of Mixed Data
### Aliases: fviz_famd fviz_famd_ind fviz_famd_var fviz_famd

### ** Examples

# Compute FAMD
 library("FactoMineR")
 data(wine)
 res.famd <- FAMD(wine[,c(1,2, 16, 22, 29, 28, 30,31)], graph = FALSE)
               
# Eigenvalues/variances of dimensions
fviz_screeplot(res.famd)
# Graph of variables
fviz_famd_var(res.famd)
# Quantitative variables
fviz_famd_var(res.famd, "quanti.var", repel = TRUE, col.var = "black")
# Qualitative variables
fviz_famd_var(res.famd, "quali.var", col.var = "black")
# Graph of individuals colored by cos2
fviz_famd_ind(res.famd, col.ind = "cos2", 
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE)





