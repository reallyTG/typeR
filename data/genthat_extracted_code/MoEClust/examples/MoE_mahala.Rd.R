library(MoEClust)


### Name: MoE_mahala
### Title: Mahalanobis Distance Outlier Detection for Multivariate Response
### Aliases: MoE_mahala
### Keywords: utility

### ** Examples

data(ais)
hema <- as.matrix(ais[,3:7])
mod  <- lm(hema ~ sex + BMI, data=ais)
res  <- hema - predict(mod)
MoE_mahala(mod, res)



