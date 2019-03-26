library(Rlab)


### Name: actuator
### Title: Actuator force experiment
### Aliases: actuator
### Keywords: datasets

### ** Examples

bplot(actuator$force,by=actuator$act)
lplot(actuator$act,actuator$force,actuator$press)
anova( lm(force ~ (act+press+nozzle+line)^2, data=actuator) )



