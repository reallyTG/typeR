library(Rlab)


### Name: jet
### Title: Jet (actuator) force experiment
### Aliases: jet
### Keywords: datasets

### ** Examples

bplot(jet$force,by=jet$act)
mplot(jet$force,jet$act,jet$press,both=TRUE)
anova( lm(force ~ act+press+act:press, data=jet) )



