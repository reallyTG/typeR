library(Stem)


### Name: pm10
### Title: Realistic data which illustrate the usage of the package Stem
### Aliases: pm10
### Keywords: datasets

### ** Examples

data(pm10)
names(pm10)

#plot the coordinates
dim(pm10$coords)
plot(pm10$coords[,1],pm10$coords[,2],xlab=colnames(pm10$coords)[1],
	ylab=colnames(pm10$coords)[2])

#plot the data
dim(pm10$z)

#summary by station
apply(pm10$z,2,summary)

#plot the time series for station n.22
plot(pm10$z[,22],t="l",xlab="Days",ylab="PM10 concentrations (log)")

#plot the station altitude
plot(pm10$covariates[,3],ylab=colnames(pm10$covariates)[3],xaxt="n",xlab="")
positions = seq(1,8052,366)+366/2
axis(1, at=positions, labels=rownames(pm10$coords), las=2)



