library(BIOdry)


### Name: anova.modelFrame
### Title: Compare modelFrame objects
### Aliases: anova.modelFrame

### ** Examples

##TRW chronology (mm) and inside-bark radii
data(Pchron,envir = environment())

## Parameters of allometric model to compute Diameter at Breast
## Height over bark (DBH, cm) from diameter inside bark (dib, cm)
## and Total Tree Biomass (TTB, kg tree -1 ) from DBH (Lara
## et. al. 2013):
biom_param <- c(2.87, 0.85, 0.05, 2.5)

## Modeling tree-biomass fluctuations while accounting for
## within-plot source variability (see defaults in "modelFrame"
## function)
trwf <- modelFrame(Pchron,
                   to = 'cm',
                   MoreArgs = list(mp = c(2,1, biom_param)),
                   log.t = FALSE,
                   on.time = FALSE)

## Fitting a single linear regression of the "tdForm" formula
## without random effects to the tree-biomass data:
trwfl <- lm(log(x) ~ log(csx) + year,
            data = trwf$'model'$'data')
## Comparing model likelihoods with anova method:
anova(trwf, trwfl)



