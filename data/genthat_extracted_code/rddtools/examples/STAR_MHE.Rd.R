library(rddtools)


### Name: STAR_MHE
### Title: Transformation of the STAR dataset as used in Angrist and
###   Pischke (2008)
### Aliases: STAR_MHE

### ** Examples

data(STAR_MHE)

# Compute the group means:
STAR_MHE_means <- aggregate(STAR_MHE[, c('classid', 'pscore', 'cs')],
                            by=list(STAR_MHE$classid), mean)

# Regression of means, with weighted average:
reg_krug_gls <- lm(pscore~cs, data=STAR_MHE_means, weights=cs)
coef(summary(reg_krug_gls))[2,2]



