library(plm)


### Name: plm.data
### Title: Data Frame Special Format for Panel Data (Deprecated)
### Aliases: plm.data
### Keywords: attribute

### ** Examples

# There are 595 individuals
data("Wages", package = "plm")
Wages <- plm.data(Wages, 595)

# Gasoline contains two variables which are individual and time indexes
# The pdata.frame is called gas
data("Gasoline", package = "plm")
Gasoline <- plm.data(Gasoline, c("country","year"))
summary(Gasoline)

# Hedonic is an unbalanced panel, townid is the individual index
data("Hedonic", package = "plm")
Hedonic <- plm.data(Hedonic, "townid")



