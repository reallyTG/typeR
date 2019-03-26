library(sporm)


### Name: ks.sporm
### Title: KS test for the semiparametric proportional odds rate model
### Aliases: ks.sporm

### ** Examples

# Radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
## K-S goodness-of-fit test
ks.sporm(x,y,  B=100)



