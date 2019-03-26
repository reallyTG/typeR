library(bild)


### Name: anova-methods
### Title: Methods for Function anova in Package "bild"
### Aliases: anova-methods anova,bild-method
### Keywords: methods

### ** Examples

#####  data = locust

loc1 <- bild(move~(time+I(time^2))*feed*sex, data=locust, 
    aggregate=feed, dependence="MC1")

loc2 <- bild(move~(time+I(time^2))*feed, data=locust, 
    aggregate=feed, dependence="MC1")

anova(loc1,loc2)

loc3 <- bild(move~(time+I(time^2))*feed, data=locust, 
    aggregate=feed, dependence="MC2")

anova(loc3,loc2)

#####  data= muscatine

# we decompose the time effect in orthogonal components
muscatine$time1 <- c(-1, 0, 1)
muscatine$time2 <- c(1, -2, 1)

musc1 <- bild(obese~time1, data=muscatine, time="time1", 
        dependence="MC1")

musc1r <- bild(obese~time1, data=muscatine, time="time1", 
        dependence="MC1R")

anova(musc1, musc1r, correct=TRUE)



