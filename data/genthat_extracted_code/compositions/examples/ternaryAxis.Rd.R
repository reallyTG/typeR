library(compositions)


### Name: ternaryAxis
### Title: Axis for ternary diagrams
### Aliases: ternaryAxis
### Keywords: aplot

### ** Examples

data(SimulatedAmounts)
plot(acomp(sa.lognormals),axes=TRUE)
ternaryAxis(side=1:3,pos=0,col.axis="red",col.lab="green")
ternaryAxis(side=1:3,at=1:9/10,
            labels=expression(9:1,4:1,7:3,3:2,1:1,2:3,3:7,1:4,1:9),
            pos=0,col.axis="red",col.lab="green")
ternaryAxis(side=rep(-1:-3,3),labels=paste(seq(20,80,by=20),"%"),
            pos=rep(c(0,0.5,1),each=3),col.axis=1:3,col.lab="green")
ternaryAxis(side=rep(1:3,3),at=1:9/10,
            labels=expression(9:1,4:1,7:3,3:2,1:1,2:3,3:7,1:4,1:9),
            pos=rep(c(0,0.5,1),each=3))

plot(acomp(sa.lognormals5),axes=TRUE)
ternaryAxis(side=1:3,pos=0,col.axis="red",col.lab="green")
ternaryAxis(side=1:3,at=1:9/10,
            labels=expression(9:1,4:1,7:3,3:2,1:1,2:3,3:7,1:4,1:9),
            pos=0,col.axis="red",col.lab="green")




