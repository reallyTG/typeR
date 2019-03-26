library(cNORM)


### Name: computePowers
### Title: Compute powers of the explanatory variable a as well as of the
###   person location l (data preparation)
### Aliases: computePowers

### ** Examples

# Dataset with grade levels as grouping
data.elfe <- rankByGroup(elfe)
data.elfe <- computePowers(data.elfe)

# Dataset with continuous age variable and k = 5
data.ppvt <- rankByGroup(ppvt)
data.ppvt <- computePowers(data.ppvt, age = "age", k = 5)



