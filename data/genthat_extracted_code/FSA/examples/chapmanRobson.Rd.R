library(FSA)


### Name: chapmanRobson
### Title: Computes Chapman-Robson estimates of S and Z.
### Aliases: chapmanRobson chapmanRobson.default chapmanRobson.formula
###   plot.chapmanRobson summary.chapmanRobson confint.chapmanRobson
###   coef.chapmanRobson
### Keywords: htest manip

### ** Examples

plot(catch~age,data=BrookTroutTH,pch=19)

## demonstration of formula notation
cr1 <- chapmanRobson(catch~age,data=BrookTroutTH,ages2use=2:6)
summary(cr1)
summary(cr1,verbose=TRUE)
cbind(Est=coef(cr1),confint(cr1))
plot(cr1)
plot(cr1,axis.age="age")
plot(cr1,axis.age="recoded age")
summary(cr1,parm="Z")
cbind(Est=coef(cr1,parm="Z"),confint(cr1,parm="Z"))

## demonstration of excluding ages2use
cr2 <- chapmanRobson(catch~age,data=BrookTroutTH,ages2use=-c(0,1))
summary(cr2)
plot(cr2)

## demonstration of ability to work with missing age classes
age <- c(  2, 3, 4, 5, 7, 9,12)
ct  <- c(100,92,83,71,56,35, 1)
cr3 <- chapmanRobson(age,ct,4:12)
summary(cr3)
plot(cr3)




