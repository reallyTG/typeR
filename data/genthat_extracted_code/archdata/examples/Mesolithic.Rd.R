library(archdata)


### Name: Mesolithic
### Title: British Mesolithic assemblages
### Aliases: Mesolithic
### Keywords: datasets

### ** Examples

data(Mesolithic)
Mesolithic.pct <- prop.table(as.matrix(Mesolithic), 1)*100
apply(Mesolithic.pct, 2, quantile)
cor(Mesolithic.pct)



