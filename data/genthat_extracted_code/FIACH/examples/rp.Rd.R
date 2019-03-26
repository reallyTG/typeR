library(FIACH)


### Name: rp
### Title: Realignment parameters
### Aliases: rp
### Keywords: datasets

### ** Examples

data(rp)
z<-rp[,3]                                                     
dz<- c(0,diff(z))                                                
plot(1:104,dz,ylim=c(-1,1),main="Volume-Volume Displacement",   
xlab="Time(scans)",ylab="Displacement(mm)")
lines(1:104,dz,col="blue",lwd=3)
legend("topright",legend="dZ/dt Translation",lwd=3,col="blue")
arrows(54,.5,91,-.184)
text(48,.5,"-.184mm")



