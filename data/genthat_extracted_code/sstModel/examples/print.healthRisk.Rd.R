library(sstModel)


### Name: print.healthRisk
### Title: Printing a HealthRisk
### Aliases: print.healthRisk

### ** Examples

# Creating a new healthRisk.

corr.mat <- diag(rep(1, 2))
colnames(corr.mat) <- c("invalidity", "longetivity")
rownames(corr.mat) <- colnames(corr.mat)

healthRisk1 <- healthRisk(corr.mat  = corr.mat)
# printing the healthRisk.
print(healthRisk1)




