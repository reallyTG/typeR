library(MachineShop)


### Name: response
### Title: Extract Response Variable
### Aliases: response response.formula response.recipe

### ** Examples

## Survival response example
library(survival)
library(MASS)

fo <- Surv(time, status != 2) ~ sex + age + year + thickness + ulcer
response(fo, data = Melanoma)




