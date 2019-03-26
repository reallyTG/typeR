library(permuco)


### Name: lmperm
### Title: Permutation test for regression parameters
### Aliases: lmperm

### ** Examples

## data
data("emergencycost")

## Testing at 14 days
emergencycost$LOS14 <- emergencycost$LOS - 14

## Univariate t test
contrasts(emergencycost$insurance) <- contr.sum
contrasts(emergencycost$sex) <- contr.sum

## Warning : np argument must be greater (recommendation: np>=5000)
modlm_cost_14 <- lmperm(cost ~ LOS14*sex*insurance, data = emergencycost, np = 2000)
modlm_cost_14



