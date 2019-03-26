library(INDperform)


### Name: model_gamm
### Title: Modeling of indicator responses to single pressures with GAMMs
### Aliases: model_gamm

### ** Examples

# Using the Baltic Sea demo data in this package
dat_init <- ind_init(
  ind_tbl = data.frame(Cod = ind_ex$Sprat),
  press_tbl = press_ex[, c("Fsprat", "Fher")],
  time = ind_ex[ ,1])
gam_tbl <- model_gam(dat_init)
# Any temporal autocorrelation
gam_tbl$tac
# Applying model_gamm function and passing the $tac variable as filter
gamm_tbl <- model_gamm(dat_init, filter = gam_tbl$tac)



