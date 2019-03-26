# test -- makecrm()
library(spup)

data(dem30m)
crm1 <- makeCRM(acf0 = 0.8, range = 300, model = "Exp")
crm2 <- makeCRM(acf0 = 0.2, range = 700, model = "Sph") 
crm3 <- makeCRM(acf0 = 0.8, range = 700, model = "Lin") 
crm4 <- makeCRM(acf0 = 0.8, range = 200, model = "Gau") 

par(mfrow = c(2, 2))
plot(crm1, main = "'Spherical', acf0 = 0.8, range = 700")
plot(crm2, main = "'Spherical', acf0 = 0.2, range = 700")
plot(crm3, main = "'Linear', acf0 = 1.0, range = 700")
plot(crm4, main = "'Gaussian', acf0 = 0.8, range = 200")