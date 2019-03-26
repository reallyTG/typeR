library(mvabund)


### Name: anova.manyglm
### Title: Analysis of Deviance for Multivariate Generalized Linear Model
###   Fits for Abundance Data
### Aliases: anova.manyglm print.anova.manyglm
### Keywords: models regression multivariate

### ** Examples

## Load the Tasmania data set
data(Tasmania)

## Visualise the effect of treatment on copepod abundance
tasm.cop <- mvabund(Tasmania$copepods)
treatment <- Tasmania$treatment
block <- Tasmania$block
#plot(tasm.cop ~ treatment, col=as.numeric(block))

## Fitting predictive models using a negative binomial model for counts:
tasm.cop.nb <- manyglm(tasm.cop ~ block*treatment, family="negative.binomial")

## Testing hypotheses about the treatment effect and treatment-by-block interactions, 
## using a Wald statistic and 199 resamples (better to ramp up to 999 for a paper):
anova(tasm.cop.nb, nBoot=199, test="wald")

## Performing the Pairwise comparison:
## Not run: 
##D data(solberg)
##D abund <- mvabund(solberg$abund)
##D treatment <- as.character(solberg$x)
##D ## pairwise comparison 
##D manyglm(abund ~ treatment) -> msolglm
##D anova(msolglm, pairwise.comp = treatment, nBoot = 199)
##D # Could also run: anova(msolglm, pairwise.comp = ~treatment, nBoot = 199)
## End(Not run)



