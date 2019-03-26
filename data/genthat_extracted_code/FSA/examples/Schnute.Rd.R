library(FSA)


### Name: Schnute
### Title: The four-parameter growth function from Schnute (1981).
### Aliases: Schnute
### Keywords: manip

### ** Examples

## See the formulae
growthFunShow("Schnute",1,plot=TRUE)
growthFunShow("Schnute",2,plot=TRUE)
growthFunShow("Schnute",3,plot=TRUE)
growthFunShow("Schnute",4,plot=TRUE)

## Simple examples
ages <- 1:15
s1 <- Schnute(ages,case=1,t1=1,t3=15,L1=30,L3=400,a=0.3,b=1)
s2 <- Schnute(ages,case=2,t1=1,t3=15,L1=30,L3=400,a=0.3,b=1)
s3 <- Schnute(ages,case=3,t1=1,t3=15,L1=30,L3=400,a=0.3,b=1)
s4 <- Schnute(ages,case=4,t1=1,t3=15,L1=30,L3=400,a=0.3,b=1)

plot(s1~ages,type="l",lwd=2)
lines(s2~ages,lwd=2,col="red")
lines(s3~ages,lwd=2,col="blue")
lines(s4~ages,lwd=2,col="green")




