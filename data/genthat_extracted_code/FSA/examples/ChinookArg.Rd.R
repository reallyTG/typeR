library(FSA)


### Name: ChinookArg
### Title: Lengths and weights for Chinook Salmon from three locations in
###   Argentina.
### Aliases: ChinookArg
### Keywords: datasets

### ** Examples

str(ChinookArg)
head(ChinookArg)
op <- par(mfrow=c(2,2),pch=19,mar=c(3,3,0.5,0.5),mgp=c(1.9,0.5,0),tcl=-0.2)
plot(w~tl,data=ChinookArg,subset=loc=="Argentina")
plot(w~tl,data=ChinookArg,subset=loc=="Petrohue")
plot(w~tl,data=ChinookArg,subset=loc=="Puyehue")
par(op)




