library(bild)


### Name: airpollution
### Title: Air Pollution
### Aliases: airpollution
### Keywords: datasets

### ** Examples

str(airpollution)

#####  dependence="MC2"
air2 <- bild(wheeze~age+smoking, data=airpollution, time="age",
        aggregate=smoking, dependence="MC2")

summary(air2)
getAIC(air2)
getLogLik(air2)
plot(air2)

#####  dependence="MC2R"
air2r <- bild(wheeze~age+smoking, data=airpollution, time="age",
            aggregate=smoking, dependence="MC2R")

summary(air2r)
getAIC(air2r)
getLogLik(air2r)
plot(air2r) 

plot(air2r, which=6, subSET=smoking=="0", main="smoking==0", ident=TRUE) 



