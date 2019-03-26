library(PWFSLSmoke)


### Name: addBullseye
### Title: Add a Bullseyes to a Map or RgoogleMap Plot
### Aliases: addBullseye
### Keywords: plotting

### ** Examples

wa <- monitor_subset(Northwest_Megafires, stateCodes='WA', tlim=c(20150821,20150828))
monitorMap(wa, cex=4)
addBullseye(wa$meta$longitude, wa$meta$latitude)



