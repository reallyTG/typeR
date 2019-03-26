library(mclust)


### Name: MclustDR
### Title: Dimension reduction for model-based clustering and
###   classification
### Aliases: MclustDR print.MclustDR
### Keywords: multivariate

### ** Examples

# clustering
data(diabetes)
mod <- Mclust(diabetes[,-1])
summary(mod)

dr <- MclustDR(mod)
summary(dr)
plot(dr, what = "scatterplot")
plot(dr, what = "evalues")

# adjust the tuning parameter to show the most separating directions
dr1 <- MclustDR(mod, lambda = 1) 
summary(dr1)
plot(dr1, what = "scatterplot")
plot(dr1, what = "evalues")

# classification
data(banknote)

da <- MclustDA(banknote[,2:7], banknote$Status, modelType = "EDDA")
dr <- MclustDR(da)
summary(dr)

da <- MclustDA(banknote[,2:7], banknote$Status)
dr <- MclustDR(da)
summary(dr)



