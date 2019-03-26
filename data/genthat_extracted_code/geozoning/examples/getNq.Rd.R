library(geozoning)


### Name: getNq
### Title: getNq
### Aliases: getNq
### Keywords: internal

### ** Examples

data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7,
# saving only best last level results
criti=correctionTree(c(0.4,0.7),mapTest,SAVE=FALSE)
geozoning:::getNq(criti$critList)



