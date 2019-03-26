library(Amelia)


### Name: amelia
### Title: AMELIA: Multiple Imputation of Incomplete Multivariate Data
### Aliases: amelia amelia.amelia amelia.default amelia.molist
### Keywords: models

### ** Examples

data(africa)
a.out <- amelia(x = africa, cs = "country", ts = "year", logs = "gdp_pc")
summary(a.out)
plot(a.out)



