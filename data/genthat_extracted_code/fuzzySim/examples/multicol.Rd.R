library(fuzzySim)


### Name: multicol
### Title: Analyse multicollinearity in a dataset, including VIF
### Aliases: multicol
### Keywords: multivariate

### ** Examples

data(rotif.env)
names(rotif.env)

# calculate multicollinearity among the predictor variables:
multicol(rotif.env[ , 5:17], reorder = FALSE)
multicol(rotif.env[ , 5:17])

# you can also calculate multicol among the variables included in a model:
mod <- step(glm(Abrigh ~ Area + Altitude + AltitudeRange + 
HabitatDiversity + HumanPopulation + Latitude + Longitude + 
Precipitation + PrecipitationSeasonality + TemperatureAnnualRange 
+ Temperature + TemperatureSeasonality + UrbanArea, 
data = rotif.env))
multicol(model = mod)

# more examples using R datasets:
multicol(trees)

# you'll get a warning and some NA results if any of the variables 
# is not numeric:
multicol(OrchardSprays)

# so define the subset of numeric 'vars' to calculate 'multicol' for:
multicol(OrchardSprays[ , 1:3])



