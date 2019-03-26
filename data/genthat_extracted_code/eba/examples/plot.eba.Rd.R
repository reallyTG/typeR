library(eba)


### Name: plot.eba
### Title: Diagnostic Plot for EBA Models
### Aliases: plot.eba
### Keywords: models

### ** Examples

## Compare two choice models

data(celebrities)                     # absolute choice frequencies
btl1 <- eba(celebrities)              # fit Bradley-Terry-Luce model
A <- list(c(1,10), c(2,10), c(3,10),
          c(4,11), c(5,11), c(6,11),
          c(7,12), c(8,12), c(9,12))  # the structure of aspects
eba1 <- eba(celebrities, A)           # fit elimination-by-aspects model
anova(btl1, eba1)                     # model comparison based on likelihoods

par(mfrow = 1:2)                      # residuals versus fitted values
plot(btl1, main = "BTL", ylim = c(-4, 4.5))  # BTL doesn't fit well
plot(eba1, main = "EBA", ylim = c(-4, 4.5))  # EBA fits better



