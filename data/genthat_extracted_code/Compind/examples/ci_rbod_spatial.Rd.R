library(Compind)


### Name: ci_rbod_spatial
### Title: Spatial robust Benefit of the Doubt approach (Sp-RBoD)
### Aliases: ci_rbod_spatial

### ** Examples


data(EU_NUTS1)

coord = EU_NUTS1[,c("Long","Lat")]
k<-knearneigh(as.matrix(coord), k=5)
k_nb<-knn2nb(k)
W_mat <-nb2mat(k_nb,style="W",zero.policy=TRUE)

CI = ci_rbod_spatial(EU_NUTS1,c(2:3),M=10,B=20, W=W_mat)



