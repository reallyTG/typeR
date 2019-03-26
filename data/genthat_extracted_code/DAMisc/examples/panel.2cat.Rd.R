library(DAMisc)


### Name: panel.2cat
### Title: Lattice panel function for confidence intervals with capped bars
### Aliases: panel.2cat

### ** Examples

library(car)
library(lattice)
library(effects)
data(Duncan)
Duncan$inc.cat <- cut(Duncan$income, 3)
mod <- lm(prestige~ inc.cat * type + education,
  data=Duncan)
e1 <- effect("inc.cat*type", mod)
update(plot(e1), panel=panel.2cat)



