library(bild)


### Name: bild
### Title: Fit of Parametric Models for Binary Longitudinal Data via
###   Likelihood Method
### Aliases: bild
### Keywords: function

### ** Examples
  ## No test: 
 
## Are the examples used in respective dataset files

#####  data= airpollution, dependence="MC2R"
str(airpollution)

air2r <- bild(wheeze~age+smoking, data=airpollution, trace=TRUE, 
    time="age", aggregate=smoking, dependence="MC2R")

summary(air2r)
getAIC(air2r)
getLogLik(air2r)
plot(air2r) 

####  data=muscatine, dependence="MC2"
str(muscatine)
                                            
# we decompose the time effect in orthogonal components
muscatine$time1 <- c(-1, 0, 1)
muscatine$time2 <- c(1, -2, 1)

musc2 <- bild(obese~(time1+time2)*sex, data=muscatine, 
    time="time1", aggregate=sex, trace=TRUE, dependence="MC2")
        
summary(musc2)
getAIC(musc2)
getLogLik(musc2)
## End(No test)


