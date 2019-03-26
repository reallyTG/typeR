library(Compind)


### Name: bandwidth_CI
### Title: Multivariate mixed bandwidth selection for exogenous variables
### Aliases: bandwidth_CI

### ** Examples

data(EU_2020)
indic <- c("employ_2011", "gasemiss_2011","deprived_2011")  
dat   <- EU_2020[-c(10,18),indic]
Q_GDP <- EU_2020[-c(10,18),"percGDP_2011"]

# Conditional robust BoD Constrained VWR
band = bandwidth_CI(dat, ngood=1, nbad=2, Q = Q_GDP)



