library(lmom)


### Name: pel-functions
### Title: Parameter estimation for specific distributions by the method of
###   L-moments
### Aliases: pel... pelexp pelgam pelgev pelglo pelgno pelgpa pelgum pelkap
###   pelln3 pelnor pelpe3 pelwak pelwei
### Keywords: models

### ** Examples

# Sample L-moments of Ozone from the airquality data
data(airquality)
lmom <- samlmu(airquality$Ozone)

# Fit a GEV distribution
pelgev(lmom)



