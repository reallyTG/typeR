library(firebehavioR)


### Name: fireIndexKBDI
### Title: Fire weather indices based on cumulative weather observations
### Aliases: fireIndexKBDI

### ** Examples

#Example using RAWS meteorological station data
data(rrRAWS)
ff = rbind(
data.frame(ffm = ffm('simard', rrRAWS$rh, rrRAWS$temp_c)$fm1hr, method = 'simard'),
data.frame(ffm = ffm('wagner', rrRAWS$rh, rrRAWS$temp_c)$fm1hr, method = 'wagner'),
data.frame(ffm = ffm('anderson', rrRAWS$rh, rrRAWS$temp_c)$fm1hr, method = 'anderson')
)
ff$dateTime = rep(rrRAWS$dateTime, 3)

#NOT RUN

#par(mfrow=c(3,1))
#hist(ff$ffm[ff$method=="simard"])
#hist(ff$ffm[ff$method=="wagner"])
#hist(ff$ffm[ff$method=="anderson"])



