library(insol)


### Name: declination
### Title: Declination
### Aliases: declination

### ** Examples


declination(JDymd(2019,1,1))

jdays = JD(ISOdate(2019,1:12,21))
declination(jdays)

## Plot daily changes in declination from 2018 to 2020
jdays=JD(seq(ISOdate(2018,1,1),ISOdate(2020,12,31),by='day'))
plot(declination(jdays),xlab='days from 2018-01-01',ylab='declination')





