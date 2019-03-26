library(sstModel)


### Name: lifeRisk
### Title: Constructing a LifeRisk
### Aliases: lifeRisk

### ** Examples

# Creating new lifeRisks.

corr.mat <- diag(rep(1, 2))
colnames(corr.mat) <- c("invalidity", "longetivity")
rownames(corr.mat) <- colnames(corr.mat)

lifeRisk1 <- lifeRisk(corr.mat  = corr.mat,
                      quantile = c(0.995, 0.995))




