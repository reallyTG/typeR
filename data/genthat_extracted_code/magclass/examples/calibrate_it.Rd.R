library(magclass)


### Name: calibrate_it
### Title: calibrate_it
### Aliases: calibrate_it

### ** Examples


  data(population_magpie)
  test<-as.magpie(array(1000,dim(population_magpie[,,"A2"]),dimnames(population_magpie[,,"A2"])))
  calibrate_it(origin=population_magpie,cal_to=test[,"y1995",],cal_type="growth_rate")
  calibrate_it(origin=population_magpie,cal_to=test[,"y1995",],cal_type="convergence", 
               cal_year="y1995", end_year="y2055")
  calibrate_it(origin=population_magpie,cal_to=test[,"y1995",],cal_type="none")




