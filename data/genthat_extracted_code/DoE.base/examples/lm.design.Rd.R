library(DoE.base)


### Name: lm and aov method for class design objects
### Title: lm and aov methods for class design objects
### Aliases: lm lm.default lm.design coef.lm.design aov aov.default
###   aov.design print.summary.lm.design print.lm.design summary.lm.design
###   print.summary.aov.design print.aov.design summary.aov.design
### Keywords: array design

### ** Examples

  oa12 <- oa.design(nlevels=c(2,2,6))
  ## add a few variables to oa12
  responses <- cbind(y=rexp(12),z=runif(12))
  oa12 <- add.response(oa12, responses)
  ## want treatment contrasts rather than the default
  ## polynomial contrasts for the factors 
  oa12 <- change.contr(oa12, "contr.treatment")
  linmod.y <- lm(oa12)
  linmod.z <- lm(oa12, response="z")
  linmod.y
  linmod.z
  summary(linmod.y)
  summary(linmod.z)
  
## examples with aggregation
  plan <- oa.design(nlevels=c(2,6,2), replications=2, repeat.only=TRUE)
  y <- rnorm(24)
  z <- rexp(24)
  plan <- add.response(plan, cbind(y=y,z=z))
  lm(plan)
  lm(plan, response="z")
  lm(plan, FUN=sd)
  ## wide format
  plan <- reptowide(plan)
  plan
  design.info(plan)$responselist
  ## default: aggregate variables for first column of responselist
  lm(plan)
  ## request z variables instead (z is the column name of response list)
  lm(plan, response="z") 
  ## force analysis of first z measurement only
  lm(plan, response="z.1")
  ## use almost all options 
  ## (option use.center can only be used with center point designs 
  ##          from package FrF2)
  summary(lm(plan, response="z", degree=2, FUN=sd))




