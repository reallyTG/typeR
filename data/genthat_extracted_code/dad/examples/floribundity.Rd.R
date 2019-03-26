library(dad)


### Name: floribundity
### Title: Rose flowering
### Aliases: floribundity
### Keywords: datasets

### ** Examples

data(floribundity)
foldt <- foldert(floribundity, times = as.Date(names(floribundity)), rows.select = "union")
summary(foldt)



