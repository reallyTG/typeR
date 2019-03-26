library(raptr)


### Name: AttributeSpaces
### Title: Create new AttributeSpaces object
### Aliases: AttributeSpaces

### ** Examples

space1 <- AttributeSpace(
  PlanningUnitPoints(
    matrix(rnorm(100), ncol = 2),
    seq_len(50)),
  DemandPoints(
    matrix(rnorm(100), ncol = 2),
    runif(50)),
  species = 1L)

space2 <- AttributeSpace(
  PlanningUnitPoints(
    matrix(rnorm(100), ncol = 2),
    seq_len(50)),
  DemandPoints(
    matrix(rnorm(100), ncol = 2),
    runif(50)),
  species = 2L)

spaces <- AttributeSpaces(list(space1, space2), "spaces")




