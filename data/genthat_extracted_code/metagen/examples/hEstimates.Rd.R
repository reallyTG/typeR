library(metagen)


### Name: hEstimates
### Title: Point estimates: For the heterogeneity parameter
### Aliases: hEstimates

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
hEstimates(y=bcg_y, d=bcg_d, x=bcg_x)

# The implementation can also handle the case in which
# a meta regression is planed with no intercept and only a
# single covariate (i.e. dim(x) = 1).  In this case,
# the design matrix can simply be provided by a vector.
# (This makes no sense in this example and shall only prove
# feasibility)
hEstimates(y=bcg_y, d=bcg_d, x=bcg$x)

# When performing a meta analysis, provide the function
# with a vector of 1s.
hEstimates(y=bcg_y, d=bcg_d, x=rep(1, length(bcg_y)))



