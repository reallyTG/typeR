library(ade4)


### Name: varipart
### Title: Partition of the variation of a response multivariate table by 2
###   explanatory tables
### Aliases: varipart print.varipart

### ** Examples


data(mafragh)

# PCA on response table Y
Y <- mafragh$flo
dudiY <- dudi.pca(Y, scannf = FALSE, scale = FALSE)

# Variation partitioning based on RDA
# without covariables
vprda <- varipart(dudiY,  mafragh$env)
vprda
# Variation partitioning based on RDA
# with covariables and parametric estimation
vprda <- varipart(dudiY,  mafragh$env, mafragh$xy, type = "parametric")
vprda
names(vprda)



