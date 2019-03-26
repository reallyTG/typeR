library(sporm)


### Name: confid.int.theta
### Title: Confidence interval of the proportionality parameter
### Aliases: confid.int.theta

### ** Examples

# Radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
confid.int.theta(x, y, conf.level=.95, grd = 0.01, B=100)
confid.int.theta(x, y, method= "simulate", conf.level=.95, grd = 0.01, B=100)



