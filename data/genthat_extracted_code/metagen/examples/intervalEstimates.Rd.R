library(metagen)


### Name: intervalEstimates
### Title: Interval estimates: For the regression coefficients
### Aliases: intervalEstimates

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
bcg_h <- hEstimates(y=bcg_y, d=bcg_d, x=bcg_x)
sgnf_lev <- c(0.01, 0.025, 0.05, 0.01)

intervalEstimates(y=bcg_y, d=bcg_d, h_dat=bcg_h, x=bcg_x, sgnf=0.025)
intervalEstimates(y=bcg_y, d=bcg_d, h_dat=bcg_h, x=bcg_x,
  sgnf=sgnf_lev)



