library(ems)


### Name: mortality_rate
### Title: Mortality Rate
### Aliases: mortality_rate

### ** Examples


# Loading the dataset
data(icu)

# Creating a vector of months
date <- as.Date(icu$UnitDischargeDateTime, tryFormats = '%d/%m/%Y')
months <- as.numeric(format(date, '%m'))

# Vector of deaths
deaths <- icu$UnitDischargeName

# Calculating monthly and quarterly mortality rate
mortality_rate(deaths = deaths, period = months, option = 'both')





