library(UsingR)


### Name: MLBattend
### Title: Major league baseball attendance data
### Aliases: MLBattend
### Keywords: datasets

### ** Examples

data(MLBattend)
boxplot(attendance ~ franchise, MLBattend)
with(MLBattend, cor(attendance,wins))



