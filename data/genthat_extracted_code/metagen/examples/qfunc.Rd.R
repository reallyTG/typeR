library(metagen)


### Name: qfunc
### Title: The q_delta(tau) function.
### Aliases: qfunc

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
qfunc(y=bcg_y, d=bcg_d, x=bcg_x)



