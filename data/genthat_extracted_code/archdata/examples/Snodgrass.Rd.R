library(archdata)


### Name: Snodgrass
### Title: House pits at the Mississippian Snodgrass site in Butler County,
###   Missouri, U.S.A.
### Aliases: Snodgrass
### Keywords: datasets

### ** Examples

data(Snodgrass)
plot(-South~East, Snodgrass, main="Snodgrass Site", pch=as.numeric(Inside)+4, asp=1)
legend("topleft", levels(Snodgrass$Inside), pch=5:6)
boxplot(Area~Inside, Snodgrass)



