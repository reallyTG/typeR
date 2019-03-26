library(zoeppritz)


### Name: zoeppritz-package
### Title: Zoeppritz Equations
### Aliases: zoeppritz-package
### Keywords: package

### ** Examples



##### demo(ZOEP) 

#############  Incident wave in Low velocity layer
alpha1 = 4.98
  beta1 =  2.9
   rho1 = 2.667

  alpha2 = 8.0
   beta2 = 4.6
   rho2 = 3.38

  App =  pzoeppritz( "Amplitude" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "P", "ALL");

App =  pzoeppritz( "Amplitude" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "S", "ALL");

App =  pzoeppritz( "Energy" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "P", "ALL");

App =  pzoeppritz( "Potential" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "P", "ALL");



#############  Incident wave in high velocity layer
  alpha1 = 8.0
  beta1 =  4.6
   rho1 = 3.38

  alpha2 = 4.98
   beta2 = 2.9
   rho2 = 2.667

 App =  pzoeppritz( "Amplitude" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "P", "ALL");

App =  pzoeppritz( "Amplitude" , alpha1, alpha2, beta1, beta2, rho1 ,rho2, "S", "ALL");





