library(solaR)


### Name: A8_readBD
### Title: Daily or intradaily values of global horizontal irradiation and
###   ambient temperature from a local file or a data.frame.
### Aliases: readBD readBDi df2Meteo dfI2Meteo zoo2Meteo
### Keywords: utilities constructors

### ** Examples

data(helios)
names(helios)=c('date', 'G0', 'TempMax', 'TempMin')

bd=df2Meteo(helios, dates.col='date', lat=41, source='helios-IES', format='%Y/%m/%d')

summary(getData(bd))

xyplot(bd)



