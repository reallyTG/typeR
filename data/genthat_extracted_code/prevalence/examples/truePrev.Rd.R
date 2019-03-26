library(prevalence)


### Name: truePrev
### Title: Estimate true prevalence from individuals samples
### Aliases: truePrev

### ** Examples

## Taenia solium cysticercosis in Nepal
## 142 positives out of 742 pigs sampled

## Model SE and SP based on literature data
## Sensitivity ranges uniformly between 60% and 100%
## Specificity ranges uniformly between 75% and 100%
#> BUGS-style:
truePrev(x = 142, n = 742,
         SE = ~dunif(0.60, 1.00), SP = ~dunif(0.75, 1.00))

#> list-style:
SE <- list(dist = "uniform", min = 0.60, max = 1.00)
SP <- list(dist = "uniform", min = 0.75, max = 1.00)
truePrev(x = 142, n = 742, SE = SE, SP = SP)

## Model SE and SP based on expert opinions
## Sensitivity lies in between 60% and 100%; most likely value is 90%
## Specificity is with 95% confidence larger than 75%; most likely value is 90%
SE <- list(dist = "pert", a = 0.60, m = 0.90, b = 1.00)
SP <- list(dist = "beta-expert", mode = 0.90, lower = 0.75, p = 0.95)
truePrev(x = 142, n = 742, SE = SE, SP = SP)

## Model SE and SP as fixed values (each 90%)
truePrev(x = 142, n = 742, SE = 0.90, SP = 0.90)



