library(metagen)


### Name: hConfidence
### Title: Inference: Based on methods of moments and maximum likelihood.
### Aliases: hConfidence

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_s <- bcg$size
bcg_x <- cbind(1,bcg$x)
sgnf_lev <- c(0.01, 0.025, 0.05, 0.01)

set.seed(865287113) # for reproducibility

hConfidence(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=0.025)
hConfidence(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=sgnf_lev)



