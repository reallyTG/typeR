library(rangeBuilder)


### Name: reptileDatabaseCountries
### Title: Squamate distribution data from the Reptile Database
### Aliases: reptileDatabaseCountries getRepDBcountryList
###   getRepDBSpFromCountry getRepDBcountries

### ** Examples

# return countries of occurrence for Naja naja
getRepDBcountryList('Naja_naja')

#return species that occur in New Zealand
getRepDBSpFromCountry('New Zealand')

#return the list of countries that have such data on Reptile-Database
getRepDBcountries()



