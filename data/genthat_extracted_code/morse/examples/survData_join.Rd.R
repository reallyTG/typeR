library(morse)


### Name: survData_join
### Title: Joins a concentration with a survival data set into an argument
###   for 'survData' when the concentration varies over time
### Aliases: survData_join

### ** Examples


# (1) Load the two survival data sets
data(propiconazole_pulse_exposure)
exposure <- propiconazole_pulse_exposure[,c("replicate", "time", "conc")]
survival <- propiconazole_pulse_exposure[,c("replicate", "time", "Nsurv")]

# (2) Create an objet of class 'survData'
dat_join <- survData(survData_join(exposure, survival))
class(dat_join)




