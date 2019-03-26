library(mosaicModel)


### Name: Used_Fords
### Title: Prices of used Ford automobiles in 2009
### Aliases: Used_Fords
### Keywords: datasets

### ** Examples

mod_1 <- lm(Price ~ Mileage, data = Used_Fords)
mod_2 <- lm(Price ~ Mileage + Age, data = Used_Fords)



