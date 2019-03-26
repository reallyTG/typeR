library(metagen)


### Name: pfunc
### Title: The p_delta(eta) function.
### Aliases: pfunc

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
pfunc(y=bcg_y, d=bcg_d, x=bcg_x)

# Calculating the Mandel-Paule estimate:
pfunc(y=bcg_y, d=bcg_d, x=bcg_x)(dim(bcg_x)[1] - dim(bcg_x)[2])



