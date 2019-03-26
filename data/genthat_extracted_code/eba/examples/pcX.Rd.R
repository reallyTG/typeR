library(eba)


### Name: pcX
### Title: Paired-Comparison Design Matrix
### Aliases: pcX
### Keywords: models

### ** Examples

data(drugrisk)               # absolute choice frequencies
btl <- eba(drugrisk[, , 1])  # fit Bradley-Terry-Luce model using eba
summary(btl)

y1 <- t(drugrisk[, , 1])[lower.tri(drugrisk[, , 1])]
y0 <-   drugrisk[, , 1][ lower.tri(drugrisk[, , 1])]

## Fit Bradley-Terry-Luce model using glm
btl.glm <- glm(cbind(y1, y0) ~ 0 + pcX(6), binomial)
summary(btl.glm)

## Fit Thurstone Case V model using glm
tm.glm <- glm(cbind(y1, y0) ~ 0 + pcX(6), binomial(probit))
summary(tm.glm)



