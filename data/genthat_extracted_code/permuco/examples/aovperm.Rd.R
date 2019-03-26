library(permuco)


### Name: aovperm
### Title: P-values based on permutation tests for ANOVA and repeated
###   measures ANOVA designs.
### Aliases: aovperm

### ** Examples

## data
data("emergencycost")

## centrering the covariate to the mean
emergencycost$LOSc <- scale(emergencycost$LOS, scale = FALSE)

## ANCOVA
## Warning : np argument must be greater (recommendation: np>=5000)
mod_cost_0 <- aovperm(cost ~ LOSc*sex*insurance, data = emergencycost, np = 2000)
mod_cost_0

## Testing at 14 days
emergencycost$LOS14 <- emergencycost$LOS - 14

mod_cost_14 <- aovperm(cost ~ LOS14*sex*insurance, data = emergencycost, np = 2000)
mod_cost_14

## Effect of sex within the public insured
contrasts(emergencycost$insurance) <- contr.treatment
contrasts(emergencycost$sex) <- contr.sum
emergencycost$insurance <- relevel(emergencycost$insurance, ref = "public")

mod_cost_se <- aovperm(cost ~ LOSc*sex*insurance, data = emergencycost,
                        np = 2000, coding_sum = FALSE)
mod_cost_se


## Repeated measures ANCOVA
## data
data(jpah2016)

## centrering the covariate
jpah2016$bmic <- scale(jpah2016$bmi, scale = FALSE)

## Warning : np argument must be greater (recommendation: np>=5000)
mod_jpah2016 <- aovperm(iapa ~ bmic*condition*time+ Error(id/(time)),
                    data = jpah2016, method = "Rd_kheradPajouh_renaud")
mod_jpah2016





