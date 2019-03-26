library(respirometry)


### Name: conv_o2
### Title: Convert between units of oxygen partial pressure and
###   concentration
### Aliases: conv_o2

### ** Examples

conv_o2(o2 = 50)
conv_o2(o2 = 1:50, from = "umol_per_l", to = "ml_per_l", temp = 10, sal = 0,
	atm_pres = 1100)
conv_o2()[c('mmHg','kPa')]




