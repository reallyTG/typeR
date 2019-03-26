library(sstModel)


### Name: summary.lifeRisk
### Title: Summarizing a LifeRisk
### Aliases: summary.lifeRisk

### ** Examples

# Creating a new lifeRisk.

corr.mat <- diag(rep(1, 2))
colnames(corr.mat) <- c("invalidity", "longetivity")
rownames(corr.mat) <- colnames(corr.mat)

lifeRisk1 <- lifeRisk(corr.mat  = corr.mat,
                      quantile = c(0.995, 0.995))
# summarizing the lifeRisk.
summary(lifeRisk1)




