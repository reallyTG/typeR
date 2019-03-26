library(alr4)


### Name: fuel2001
### Title: Fuel consumption
### Aliases: fuel2001
### Keywords: datasets

### ** Examples

head(fuel2001)
# Most of the examples in ALR3 that use these data first 
# transform several of the columns
fuel2001 <- transform(fuel2001,
     Dlic=1000 * Drivers/Pop,
     Fuel=1000 * FuelC/Pop,
     Income=Income/1000)
pairs(Fuel~Tax + Dlic + Income + log2(Miles), data=fuel2001)



