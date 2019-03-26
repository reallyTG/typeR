library(sporm)


### Name: dd.est
### Title: Dabrowska-Doksum's estimate of theta
### Aliases: dd.est

### ** Examples

# Radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
# Dabrowska-Doksum's estimate of theta
dd.est(x,y)
dd.est(y,x)



