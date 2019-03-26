library(solarPos)


### Name: solarPosition
### Title: Solar zenith and azumith angles
### Aliases: solarPosition

### ** Examples

##Julian day

jd <- julianDay(2003,10,17,12,30,30,tz=-7)


##Solar angles

solarPosition(jd,-105.1786,39.742476,delta_t=67,elev=1830.14,temp=11,pres=820)



