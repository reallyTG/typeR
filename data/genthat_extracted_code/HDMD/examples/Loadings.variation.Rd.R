library(HDMD)


### Name: Loadings.variation
### Title: Proportional and Cumulative Variation of Loading Components
### Aliases: Loadings.variation

### ** Examples


PCA_SVD = prcomp(USArrests, scale = TRUE)
PCA_SVD$rotation
Loadings.variation(PCA_SVD$sdev)

PCA_EIG = princomp(USArrests, cor = TRUE)
PCA_EIG$loadings
Loadings.variation(PCA_EIG$sdev)




