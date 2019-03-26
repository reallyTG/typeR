library(autoFRK)


### Name: mrts
### Title: Multi-Resolution Thin-plate Spline Basis Functions
### Aliases: mrts

### ** Examples

knot=seq(0,1,l=30)
b=mrts(knot,30)
x0=seq(0,1,l=200)
bx=predict(b,x0) 
par(mfrow=c(5,6),mar=c(0,0,0,0))
for(i in 1:30) { plot(bx[,i],type="l",axes=FALSE); box()}



