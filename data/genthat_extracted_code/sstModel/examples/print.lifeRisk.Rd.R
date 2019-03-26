library(sstModel)


### Name: print.lifeRisk
### Title: Printing a LifeRisk
### Aliases: print.lifeRisk

### ** Examples

# Creating a new lifeRisk.

corr.mat <- diag(rep(1, 2))
colnames(corr.mat) <- c("invalidity", "longetivity")
rownames(corr.mat) <- colnames(corr.mat)

lifeRisk1 <- lifeRisk(corr.mat  = corr.mat,
                      quantile = c(0.995, 0.995))
# printing the lifeRisk.
print(lifeRisk1)




