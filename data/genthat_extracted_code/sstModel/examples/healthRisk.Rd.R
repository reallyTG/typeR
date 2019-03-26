library(sstModel)


### Name: healthRisk
### Title: Constructing a HealthRisk
### Aliases: healthRisk

### ** Examples

# Creating new healthRisks.

corr.mat <- diag(rep(1, 2))
colnames(corr.mat) <- c("invalidity", "longetivity")
rownames(corr.mat) <- colnames(corr.mat)

healthRisk1 <- healthRisk(corr.mat  = corr.mat)




