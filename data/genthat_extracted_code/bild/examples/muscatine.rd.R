library(bild)


### Name: muscatine
### Title: Muscatine
### Aliases: muscatine
### Keywords: datasets

### ** Examples

str(muscatine)

# we decompose the time effect in orthogonal components
muscatine$time1 <- c(-1, 0, 1)
muscatine$time2 <- c(1, -2, 1)

# second order Markov Chain without random effects
musc2 <- bild(obese~(time1+time2)*sex, data=muscatine,  
    time="time1", aggregate=sex, trace=TRUE, dependence="MC2")

summary(musc2)
getAIC(musc2)
getLogLik(musc2)



