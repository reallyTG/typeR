library(SensoMineR)


### Name: barrow
### Title: Barplot per row with respect to a set of quantitative variables
### Aliases: barrow
### Keywords: univar

### ** Examples

data(chocolates)
resdecat<-decat(sensochoc, formul = "~Product+Panelist", firstvar = 5, 
    graph = FALSE)
## Not run: 
##D barrow(resdecat$tabT)
##D barrow(resdecat$coeff, color = "orange")
## End(Not run)



