library(SoilR)


### Name: bind.C14curves
### Title: Binding of pre- and post-bomb Delta14C curves
### Aliases: bind.C14curves

### ** Examples

#Bind the IntCal13 dataset and Hua2013 for the NH Zone 1
bp=bind.C14curves(prebomb=IntCal13,postbomb=Hua2013$NHZone1,time.scale="BP")

plot(bp[,1:2],type="l")
plot(bp[,1:2],type="l",xlim=c(-100,100))

#Report results in years AD
ad=bind.C14curves(prebomb=IntCal13,postbomb=Hua2013$NHZone1,time.scale="AD")

plot(ad[,1:2],type="l")
plot(ad[,1:2],type="l",xlim=c(0,2010))
abline(v=1950,lty=2)



