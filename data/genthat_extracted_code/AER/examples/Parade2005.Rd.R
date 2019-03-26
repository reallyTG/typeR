library(AER)


### Name: Parade2005
### Title: Parade Magazine 2005 Earnings Data
### Aliases: Parade2005
### Keywords: datasets

### ** Examples

## data
data("Parade2005")
attach(Parade2005)
summary(Parade2005)

## bivariate visualizations
plot(density(log(earnings), bw = "SJ"), type = "l", main = "log(earnings)")
rug(log(earnings))
plot(log(earnings) ~ gender, main = "log(earnings)")

## celebrity vs. non-celebrity earnings
noncel <- subset(Parade2005, celebrity == "no")
cel <- subset(Parade2005, celebrity == "yes")

library("ineq")
plot(Lc(noncel$earnings), main = "log(earnings)")
lines(Lc(cel$earnings), lty = 2)
lines(Lc(earnings), lty = 3)

Gini(noncel$earnings)
Gini(cel$earnings)
Gini(earnings)

## detach data
detach(Parade2005)



