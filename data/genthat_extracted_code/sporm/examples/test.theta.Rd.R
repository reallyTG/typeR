library(sporm)


### Name: test.theta
### Title: Hypothesis test for proportionality parameter
### Aliases: test.theta

### ** Examples

# Radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
test.theta(x,y,B=100)



