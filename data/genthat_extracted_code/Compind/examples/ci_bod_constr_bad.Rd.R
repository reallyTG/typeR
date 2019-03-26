library(Compind)


### Name: ci_bod_constr_bad
### Title: Constrained Benefit of the Doubt approach (BoD) in presence of
###   undesirable indicators
### Aliases: ci_bod_constr_bad

### ** Examples

data(EU_2020)
indic <- c("employ_2011", "percGDP_2011", "gasemiss_2011","deprived_2011")  
dat <- EU_2020[-c(10,18),indic]

# BoD Constrained VWR
CI_BoD_C = ci_bod_constr_bad(dat, ngood=2, nbad=2, low_w=0.05, pref=NULL)
CI_BoD_C$ci_bod_constr_bad_est

# BoD Constrained ordVWR
importance <- c("gasemiss_2011","percGDP_2011","employ_2011")
CI_BoD_C = ci_bod_constr_bad(dat, ngood=2, nbad=2, low_w=0.05, pref=importance)
CI_BoD_C$ci_bod_constr_bad_est



