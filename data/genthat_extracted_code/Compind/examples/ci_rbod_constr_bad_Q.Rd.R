library(Compind)


### Name: ci_rbod_constr_bad_Q
### Title: Conditional robust constrained Benefit of the Doubt approach
###   (BoD) in presence of undesirable indicators
### Aliases: ci_rbod_constr_bad_Q

### ** Examples

data(EU_2020)

indic <- c("employ_2011", "gasemiss_2011","deprived_2011")  
dat   <- EU_2020[-c(10,18),indic]
Q_GDP <- EU_2020[-c(10,18),"percGDP_2011"]

# Conditional robust BoD Constrained VWR
band = bandwidth_CI(dat, ngood=1, nbad=2, Q = Q_GDP)

CI_BoD_C = ci_rbod_constr_bad_Q(dat, 
                                ngood=1, 
                                nbad=2, 
                                low_w=0.05, 
                                pref=NULL, 
                                M=10, 
                                B=50, 
                                Q=Q_GDP, 
                                bandwidth = band$bandwidth)
CI_BoD_C$ci_rbod_constr_bad_Q_est


# # Conditional robust BoD Constrained ordVWR
# import <- c("gasemiss_2011","employ_2011", "deprived_2011")
# 
# CI_BoD_C2 = ci_rbod_constr_bad_Q(dat, 
#                                  ngood=1, 
#                                  nbad=2, 
#                                  low_w=0.05, 
#                                  pref=import, 
#                                  M=10, 
#                                  B=50, 
#                                  Q=Q_GDP, 
#                                  bandwidth = band$bandwidth)
# CI_BoD_C2$ci_rbod_constr_bad_Q_est



