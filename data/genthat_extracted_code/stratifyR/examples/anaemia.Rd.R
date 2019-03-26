library(stratifyR)


### Name: anaemia
### Title: Micronutrient data on Anaemia in Fiji
### Aliases: anaemia
### Keywords: datasets

### ** Examples

data(anaemia)
head(anaemia)
Iron <- anaemia$Iron
min(Iron); max(Iron)
hist(anaemia$Haemoglobin)
boxplot(anaemia$Folate)




