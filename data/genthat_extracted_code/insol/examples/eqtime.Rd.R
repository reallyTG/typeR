library(insol)


### Name: eqtime
### Title: Equation of time
### Aliases: eqtime

### ** Examples

# plot the equation of time for 2013 at daily intervals
jdays = seq(ISOdate(2013,1,1),ISOdate(2013,12,31),by='day')
jd = JD(jdays)
plot(eqtime(jd))
abline(h=0,col=8)

# Analema
plot(eqtime(jd),declination(jd))

# Analema from Greenwich Observatory
latGwch = 51.4791
x = 180+eqtime(jd)*15/60
y = 90-latGwch+declination(jd)
plot(x,y,ylim=c(0,90),xlab=expression(paste('Azimuth (',degree,')')),
	ylab=expression(paste('Elevation (',degree,')')))

## Add the solstices and equinoxes (nearest day, see Meeus ch. 26 for more precision)
decl = declination(jd)
wintersolstice = which(decl==min(decl))
summersolstice = which(decl==max(decl))
## spring equinox: when declination becomes zero in the first part of the year
springeqx = uniroot(declination,jd[c(1,180)])$root
springeqx = daydoy(JD(springeqx,inv=TRUE))
autumeqx = uniroot(declination,jd[c(180,360)])$root
autumeqx = daydoy(JD(autumeqx,inv=TRUE))
nodeseqx = c(springeqx,summersolstice,autumeqx,wintersolstice)
points(x[nodeseqx],y[nodeseqx],pch=19,col=3)
abline(h=c(90-latGwch,90-latGwch+max(decl),90-latGwch+min(decl)),col=8)




