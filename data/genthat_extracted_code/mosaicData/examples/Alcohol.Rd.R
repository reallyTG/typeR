library(mosaicData)


### Name: Alcohol
### Title: Alcohol Consumption per Capita
### Aliases: Alcohol

### ** Examples

data(Alcohol)
# There are only a few observations in years other than 2005 and 2008
subset(Alcohol, ! year %in% c(2005,2008))



