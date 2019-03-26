library(firebehavioR)


### Name: ffm
### Title: Estimate fine fuel moisture
### Aliases: ffm

### ** Examples

#Example using RAWS meteorological station data
data(rrRAWS)
wx = rrRAWS[2000:3000,]
ff = rbind(
data.frame(ffm = ffm('simard',wx$rh, wx$temp_c)$fm1hr,method='simard'),
data.frame(ffm = ffm('wagner',wx$rh, wx$temp_c)$fm1hr,method='wagner'),
data.frame(ffm = ffm('anderson',wx$rh, wx$temp_c)$fm1hr,method='anderson')
)
ff$dateTime = rep(wx$dateTime,3)
par(mfrow=c(3,1))
hist(ff$ffm[ff$method=="simard"])
hist(ff$ffm[ff$method=="wagner"])
hist(ff$ffm[ff$method=="anderson"])

#The FBO method requires more inputs
rh = wx$rh
temp =wx$temp_c
month = as.numeric(format(strptime(wx$dateTime,"%m/%d/%Y %H:%M"),'%m'))
hour = as.numeric(format(strptime(wx$dateTime,"%m/%d/%Y %H:%M"),'%H'))
ffm(method = 'fbo', rh, temp, month, hour, asp = 'N', slp = 10, bla = 'l', shade = 'n')



