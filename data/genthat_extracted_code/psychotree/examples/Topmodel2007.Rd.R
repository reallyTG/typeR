library(psychotree)


### Name: Topmodel2007
### Title: Attractiveness of Germany's Next Topmodels 2007
### Aliases: Topmodel2007
### Keywords: datasets

### ** Examples

data("Topmodel2007", package = "psychotree")
summary(Topmodel2007$preference)
xtabs(~ gender + I(age < 30), data = Topmodel2007)



