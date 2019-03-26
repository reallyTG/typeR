library(shapes)


### Name: procOPA
### Title: Ordinary Procrustes analysis
### Aliases: procOPA
### Keywords: multivariate

### ** Examples

data(digit3.dat)

A<-digit3.dat[,,1]
B<-digit3.dat[,,2]
ans<-procOPA(A,B) 
plotshapes(A,B,joinline=1:13)
plotshapes(ans$Ahat,ans$Bhat,joinline=1:13)

#Sooty Mangabey data
data(sooty.dat)
A<-sooty.dat[,,1]   #juvenile
B<-sooty.dat[,,2]   #adult
par(mfrow=c(1,3))
par(pty="s")
plot(A,xlim=c(-2000,3000),ylim=c(-2000,3000),xlab=" ",ylab=" ")
lines(A[c(1:12,1),])
points(B)
lines(B[c(1:12,1),],lty=2)
title("Juvenile (-------) Adult (- - - -)")
#match B onto A
out<-procOPA(A,B)
#rotation angle
print(atan2(out$R[1,2],out$R[1,1])*180/pi)
#scale
print(out$s)
plot(A,xlim=c(-2000,3000),ylim=c(-2000,3000),xlab=" ",ylab=" ")
lines(A[c(1:12,1),])
points(out$Bhat)
lines(out$Bhat[c(1:12,1),],lty=2)
title("Match adult onto juvenile")
#match A onto B
out<-procOPA(B,A)
#rotation angle
print(atan2(out$R[1,2],out$R[1,1])*180/pi)
#scale
print(out$s)
plot(B,xlim=c(-2000,3000),ylim=c(-2000,3000),xlab=" ",ylab=" ")
lines(B[c(1:12,1),],lty=2)
points(out$Bhat)
lines(out$Bhat[c(1:12,1),])
title("Match juvenile onto adult")



