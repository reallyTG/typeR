library(fishmethods)


### Name: irm_h
### Title: Age-Independent Instantaneous Rates Tag Return Model of Hoenig
###   et al. (1998)
### Aliases: irm_h
### Keywords: misc

### ** Examples

# Data come from Table 4 and model structure from Table 5 under "year-specific F, 
# constant M" in Hoenig et al. (1998)  
data(Hoenig)
model1<-irm_h(relyrs = Hoenig$relyrs, recapyrs = Hoenig$recapyrs, 
N = Hoenig$N, recapharv = Hoenig$recapharv,lambda = Hoenig$lambda,
phi = Hoenig$phi, Fyr = Hoenig$Fyr, Myr = Hoenig$Myr, initial = c(0.1,0.1), 
lower = c(0.0001,0.0001),upper = c(5,5), maxiter = 10000)



