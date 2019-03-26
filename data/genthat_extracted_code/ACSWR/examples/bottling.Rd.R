library(ACSWR)


### Name: bottling
### Title: A Three Factorial Experiment for Bottling Data
### Aliases: bottling
### Keywords: three factorial experiment

### ** Examples

data(bottling)
summary(bottling.aov <- aov(Deviation~.^3,bottling))
# Equivalent way
summary(aov(Deviation~ Carbonation + Pressure + Speed+ (Carbonation*Pressure)+
(Carbonation*Speed)+(Pressure*Speed)+(Carbonation*Speed*Pressure),data=bottling)) 



