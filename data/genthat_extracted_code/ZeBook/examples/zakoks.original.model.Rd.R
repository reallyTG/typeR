library(ZeBook)


### Name: zakoks.original.model
### Title: Classical SEIR model for plant diseases from Zadoks (1971)
### Aliases: zakoks.original.model

### ** Examples

weather=subset(weather_FranceWest, WEYR==1997 & idsite==39)
out=zakoks.original.model(nlpd=4*10,nipd=1*10,dmfr=16,SITE0 = 5*10^9,
weather, sdate = 145, ldate = 145+50 , XLAT0=1)
plot(out$sim$DACE,out$sim$severity, type="l")



