library(sstModel)


### Name: summary.healthRisk
### Title: Summarizing a HealthRisk
### Aliases: summary.healthRisk

### ** Examples

# Creating a new healthRisk.

corr.mat <- diag(rep(1, 2))
colnames(corr.mat) <- c("invalidity", "longetivity")
rownames(corr.mat) <- colnames(corr.mat)

healthRisk1 <- healthRisk(corr.mat  = corr.mat)
# summarizing the healthRisk.
summary(healthRisk1)




