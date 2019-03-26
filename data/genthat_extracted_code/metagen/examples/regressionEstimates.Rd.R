library(metagen)


### Name: regressionEstimates
### Title: Point estimates: For the regression coefficients
### Aliases: regressionEstimates

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
bcg_h <- hEstimates(y=bcg_y, d=bcg_d, x=bcg_x)
regressionEstimates(y=bcg_y, d=bcg_d, h_dat=bcg_h, x=bcg_x)



