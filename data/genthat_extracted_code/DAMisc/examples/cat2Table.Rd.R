library(DAMisc)


### Name: cat2Table
### Title: Fitted Values and CIs for 2-Categorical Interactions
### Aliases: cat2Table

### ** Examples

library(car)
data(Duncan)
Duncan$inc.cat <- cut(Duncan$income, 3)
mod <- lm(prestige ~ inc.cat*type + income, data=Duncan)
e1 <- effect("inc.cat*type", mod)
cat2Table(e1)



