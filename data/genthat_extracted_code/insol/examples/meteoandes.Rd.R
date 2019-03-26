library(insol)


### Name: meteoandes
### Title: Mountain meteorological data
### Aliases: meteoandes
### Keywords: datasets

### ** Examples

data(meteoandes)
str(meteoandes) 

# plot the 2 pyranometers measurements 
# one facing up: incident insolation, one facing down: reflected insolation

meteodate = strptime(paste(meteoandes$year,meteoandes$doy,meteoandes$hh,meteoandes$mm),
	format="%Y %j %H %M",tz="America/Santiago")
plot(meteodate,meteoandes$pyra1,'l',col=2,xlab='Date',
	ylab=expression(paste('Solar radiation [ ',Wm^-2,' ]')),
	main='Insolation at Loma Larga glacier') 
lines(meteodate,meteoandes$pyra2,col=4)




