library(zoeppritz)


### Name: plotzoeppritz
### Title: Plot Scattering (Zoeppritz) Coefficients
### Aliases: plotzoeppritz
### Keywords: hplot

### ** Examples



alpha1 = 4.98
  beta1 =  2.9
   rho1 = 2.667

  alpha2 = 8.0
   beta2 = 4.6
   rho2 = 3.38
###############   create the scattering matrix:
 App =  pzoeppritz( "Amplitude" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "P", "NONE");

#########  plot
plotzoeppritz(App)




