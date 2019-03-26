library(AER)


### Name: HousePrices
### Title: House Prices in the City of Windsor, Canada
### Aliases: HousePrices
### Keywords: datasets

### ** Examples

data("HousePrices")

### Anglin + Gencay (1996), Table II
fm_ag <- lm(log(price) ~ driveway + recreation + fullbase + gasheat + 
  aircon + garage + prefer + log(lotsize) + log(bedrooms) + 
  log(bathrooms) + log(stories), data = HousePrices)

### Anglin + Gencay (1996), Table III
fm_ag2 <- lm(log(price) ~ driveway + recreation + fullbase + gasheat + 
  aircon + garage + prefer + log(lotsize) + bedrooms + 
  bathrooms + stories, data = HousePrices)

### Verbeek (2004), Table 3.1
fm <- lm(log(price) ~ log(lotsize) + bedrooms + bathrooms + aircon, data = HousePrices)
summary(fm)

### Verbeek (2004), Table 3.2
fm_ext <- lm(log(price) ~ . - lotsize + log(lotsize), data = HousePrices)
summary(fm_ext)

### Verbeek (2004), Table 3.3
fm_lin <- lm(price ~ . , data = HousePrices)
summary(fm_lin)



