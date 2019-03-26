library(NITPicker)


### Name: findPathF3
### Title: Find best subset of points for follow-up experiments, using F3
###   metric
### Aliases: findPathF3

### ** Examples

 

#Set up data:
namAtlantic=CanadianWeather$region[as.character(colnames(CanadianWeather$monthlyTemp))]
atlanticCities=which(namAtlantic=="Atlantic")
matAtlantic=CanadianWeather$monthlyTemp[, names(atlanticCities)]

namContinental=CanadianWeather$region[as.character(colnames(CanadianWeather$monthlyTemp))]
continentalCities=which(namContinental=="Continental")
matContinental=CanadianWeather$monthlyTemp[, names(continentalCities)]

#find a set of points that helps capture the difference 
#between Atlantic and Continental cities, normalised by the variance
#make numPerts >=20 for real data
## No test: 
a=findPathF3(c(1:12),  matAtlantic,  matContinental, 5, numPerts=3)
## End(No test) 
## No test: 
print(a) #indices of months to select for follow-up experiments
## End(No test)
## No test: 
print(rownames(CanadianWeather$monthlyTemp)[a]) #month names selected
## End(No test)




