library(metaplus)


### Name: metaplus
### Title: Fits random effects meta-analysis models, using either a
###   standard normal distribution, a t-distribution or a mixture of
###   normals for the random effect.
### Aliases: metaplus
### Keywords: models

### ** Examples

## Not run: 
##D library(metaplus)
##D 
##D # perform meta-analysis for mag studies, which have no outliers
##D # fit standard normal random-effect model and print summary
##D mag.meta <- metaplus(yi, sei, slab = study, data = mag)
##D summary(mag.meta)
##D # repeat, but this time plot the profile likelihood diagnostic plot using plotci
##D mag.meta <- metaplus(mag$yi, mag$sei, slab = mag$study, plotci = TRUE)
##D # plot a forest plot with exponential transform, so that the odds ratios are plotted
##D plot(mag.meta, atransf = exp, at = log(c(.01, .1, 1, 10, 100)), xlab = "Odds Ratio",
##D   cex = 0.75)
##D # repeat for t-distribution random effects
##D mag.tdist <- metaplus(yi, sei, slab = study,
##D   random = "t-dist", data = mag)
##D summary(mag.tdist)
##D # use parametric bootstrap to test for presence of outliers
##D summary(testOutliers(mag.tdist))
##D # repeat for robust mixture random effects
##D mag.mix <- metaplus(yi, sei, slab = study,
##D   random = "mixture", data = mag)
##D summary(mag.mix)
##D # use parametric bootstrap to test for presence of outliers
##D summary(testOutliers(mag.mix))
##D 
##D 
##D # perform meta-analysis for CDP studies
##D # where there is one outlier
##D cdp.meta <- metaplus(yi, sei, slab = study, data = cdp)
##D summary(cdp.meta)
##D cdp.tdist <- metaplus(yi, sei, slab = study,
##D   random = "t-dist", data = cdp)
##D summary(cdp.tdist)
##D summary(testOutliers(cdp.tdist))
##D cdp.mix <- metaplus(yi, sei, slab = study,
##D   random = "mixture", data = cdp)
##D summary(cdp.mix)
##D summary(testOutliers(cdp.mix))
##D 
##D # extract and plot outlier probabilities
##D cdp.mix.outlierProbs <- outlierProbs(cdp.mix)
##D plot(cdp.mix.outlierProbs)
##D 
##D # produce forest plot with summary for all 3 models, showing narrower confidence
##D # intervals for robust models
##D plot(cdp.meta, extrameta = list(cdp.tdist, cdp.mix), xlab = "Standardised Mean Difference")
##D 
##D 
##D # effect of exercise on depression with covariate of length of study
##D # fit the 3 models
##D exercise.meta <- metaplus(smd, sqrt(varsmd),
##D   mods = duration, slab = study, data = exercise)
##D summary(exercise.meta)
##D exercise.mix <- metaplus(smd, sqrt(varsmd),
##D   mods = duration, slab = study, random = "mixture",
##D   data = exercise)
##D summary(exercise.mix)
##D exercise.testOutliers <- testOutliers(exercise.mix)
##D summary(exercise.testOutliers)
##D 
##D # identify possible outliers
##D exercise.outlierProbs <- outlierProbs(exercise.mix)
##D plot(exercise.outlierProbs)
##D 
##D # centre duration at different values to obtain predictions at 4, 8 and 12 weeks 
##D exercise$duration4 <- exercise$duration-4
##D exercise$duration8 <- exercise$duration-8
##D exercise$duration12 <- exercise$duration-12
##D 
##D # fit the different models, giving each an appropriate label
##D exercise.nodurn <- metaplus(smd, sqrt(varsmd),
##D   label = "Random Mixture (No Duration)", slab = study,
##D   random = "mixture", data = exercise)
##D exercise.wk4 <- metaplus(smd, sqrt(varsmd),
##D   mods = duration4, label = "Random Mixture (Week 4)",
##D   slab = study, random = "mixture", data = exercise)
##D exercise.wk8 <- metaplus(smd, sqrt(varsmd),
##D   mods = duration8, label = "Random Mixture (Week 8)",
##D   slab = study, random = "mixture", data = exercise)
##D exercise.wk12 <- metaplus(smd, sqrt(varsmd),
##D   mods = duration12, label = "Random Mixture (Week 12)",
##D   slab = study, random = "mixture", data = exercise)
##D   
##D # produce forest plot with summary for each model with robust mixture model at different weeks
##D plot(exercise.nodurn, extrameta = list(exercise.wk4, exercise.wk8,
##D   exercise.wk12), xlab = "Standardised mean difference")
## End(Not run)



