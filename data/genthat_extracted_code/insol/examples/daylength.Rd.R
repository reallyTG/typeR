library(insol)


### Name: daylength
### Title: Length of daylight
### Aliases: daylength

### ** Examples

daylength(47,11,JDymd(2019,1,1,12),1)
daylength(c(47,75),11,2456282,1)

# Daylength for the whole 2019 year
jd2019=JD(seq(ISOdate(2019,1,1),ISOdate(2019,12,31),by='day'))
plot(daylength(47,11,jd2019,1)[,3],xlab='Day of the year',ylab='day length [h]',ylim=c(0,24))




