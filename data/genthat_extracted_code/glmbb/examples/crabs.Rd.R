library(glmbb)


### Name: crabs
### Title: Horseshoe Crab Mating Data
### Aliases: crabs

### ** Examples

  data(crabs)
  gout <- glm(satell ~ color + spine + width + weight, family = poisson,
      data = crabs)



