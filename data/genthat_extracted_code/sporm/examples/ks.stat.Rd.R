library(sporm)


### Name: ks.stat
### Title: KS statistic for proportional odds rate model
### Aliases: ks.stat

### ** Examples

# Use radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
ks.stat(x,y)



