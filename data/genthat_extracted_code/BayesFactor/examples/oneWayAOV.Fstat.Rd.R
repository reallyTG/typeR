library(BayesFactor)


### Name: oneWayAOV.Fstat
### Title: Use F statistic to compute Bayes factor for balanced one-way
###   designs
### Aliases: oneWayAOV.Fstat
### Keywords: htest

### ** Examples

## Example data "InsectSprays" - see ?InsectSprays
require(stats); require(graphics)
boxplot(count ~ spray, data = InsectSprays, xlab = "Type of spray", 
        ylab = "Insect count", main = "InsectSprays data", varwidth = TRUE, 
        col = "lightgray")

## Classical analysis (with transformation)
classical <- aov(sqrt(count) ~ spray, data = InsectSprays)
plot(classical)
summary(classical)

## Bayes factor (a very large number)
Fvalue <- anova(classical)$"F value"[1]
result <- oneWayAOV.Fstat(Fvalue, N=12, J=6)
exp(result[['bf']])



