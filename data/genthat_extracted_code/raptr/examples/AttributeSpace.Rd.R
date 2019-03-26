library(raptr)


### Name: AttributeSpace
### Title: Create new AttributeSpace object
### Aliases: AttributeSpace

### ** Examples

space <- AttributeSpace(
 PlanningUnitPoints(
   matrix(rnorm(100), ncol = 2),
   seq_len(50)),
 DemandPoints(
   matrix(rnorm(100), ncol = 2),
   runif(50)),
 species = 1L)




