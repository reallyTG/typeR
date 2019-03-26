library(archdata)


### Name: Acheulean
### Title: Seven African Acheulean Sites
### Aliases: Acheulean
### Keywords: datasets

### ** Examples

data(Acheulean)
# Compute percentages for each assemblage
Acheulean.pct <- prop.table(as.matrix(Acheulean[,3:14]), 1)*100
round(Acheulean.pct, 2)
plot(OST~HA, Acheulean.pct)
boxplot(Acheulean.pct)



