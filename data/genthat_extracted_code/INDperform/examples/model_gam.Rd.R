library(INDperform)


### Name: model_gam
### Title: Modeling of indicator responses to single pressures with GAMs
### Aliases: model_gam

### ** Examples

# Using the Baltic Sea demo data in this package
dat_init <- ind_init(
  ind_tbl = ind_ex[, c("Sprat", "Cod")],
  press_tbl = press_ex[, c("Tsum", "Swin", "Fcod", "Fher")],
  time = ind_ex[ ,1])
gam_tbl <- model_gam(dat_init)
# Any outlier?
gam_tbl$pres_outlier
# Exclude outliers by passing this list as input:
gam_tbl_out <- model_gam(dat_init, excl_outlier = gam_tbl$pres_outlier)

## No test: 
 # Using another error distribution
 ind_sub <- round(exp(ind_ex[ ,c(2,8,9)]),0) # to unlog data and convert to integers
 ind_tbl2 <- ind_init(ind_sub, press_ex, time = ind_ex$Year)
 model_gam(ind_tbl2, family = poisson(link="log"))
## End(No test)



