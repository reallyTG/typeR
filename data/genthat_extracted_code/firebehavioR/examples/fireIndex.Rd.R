library(firebehavioR)


### Name: fireIndex
### Title: Fire weather indices based on static weather observations
### Aliases: fireIndex

### ** Examples

#Example using RAWS meteorological station data
data(rrRAWS)
rrRAWS.daily =   rrRAWS[format(strptime(rrRAWS$dateTime, "%m/%d/%Y %H:%M"), "%H:%M")=="14:35",]
fireIndex(temp=rrRAWS.daily$temp_c, u= rrRAWS.daily$windSpeed_kmh, rh = rrRAWS.daily$rh)



