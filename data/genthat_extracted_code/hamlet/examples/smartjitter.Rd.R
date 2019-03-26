library(hamlet)


### Name: smartjitter
### Title: Smart jittering function for deterministic shifting of
###   overlapping values
### Aliases: smartjitter
### Keywords: dplot

### ** Examples

data(vcapwide)

plot.new()
plot.window(xlim=extendrange(c(0,1)), ylim=extendrange(vcapwide[,"PSAWeek4"]))
y1 <- vcapwide[vcapwide[,"CastrationDate"]=="100413","PSAWeek4"]
y2 <- vcapwide[vcapwide[,"CastrationDate"]=="170413","PSAWeek4"]
points(x=0+smartjitter(y1, type=2, amount=0.02), y=y1)
points(x=1+smartjitter(y2, type=2, amount=0.02), y=y2)
axis(1, at=c(0,1), labels=c("10.04.13", "17.04.13"))
axis(2); box()
title(ylab="PSA at week 4", xlab="Castration batches")



