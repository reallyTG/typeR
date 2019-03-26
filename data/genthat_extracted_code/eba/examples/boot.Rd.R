library(eba)


### Name: boot
### Title: Bootstrap for Elimination-by-Aspects (EBA) Models
### Aliases: boot eba.boot eba.boot.constrained
### Keywords: models

### ** Examples

data(pork)  # pork tasting data, 10 individual paired comparison matrices
btl1 <- eba(apply(pork, 1:2, sum))  # fit Bradley-Terry-Luce model
b <- boot(pork, 200)                # resample 200 times

plot(btl1$estimate, b$stat[, "mean"], log="xy")
abline(0, 1, lty=2)



