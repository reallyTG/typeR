library(openintro)


### Name: smoking
### Title: UK Smoking Data
### Aliases: smoking
### Keywords: datasets, smoking

### ** Examples

data(smoking)
str(smoking)
histPlot(smoking$amtWeekends)
histPlot(smoking$amtWeekdays)
table(smoking$smoke, smoking$gender)
mosaicplot(~ smoke + maritalStatus, data = smoking)
barplot(sort(table(smoking$maritalStatus), decreasing = TRUE))



