library(BSDA)


### Name: Region
### Title: Pollution index taken in three regions of the country
### Aliases: Region
### Keywords: datasets

### ** Examples


boxplot(pollution ~ region, data = Region, col = "gray")
anova(lm(pollution ~ region, data = Region))




