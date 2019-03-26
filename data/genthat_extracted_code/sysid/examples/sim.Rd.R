library(sysid)


### Name: sim
### Title: Simulate response of dynamic system
### Aliases: sim

### ** Examples

# ARX Model
u <- idinput(300,"rgs")
model <- idpoly(A=c(1,-1.5,0.7),B=c(0.8,-0.25),ioDelay=1,
noiseVar=0.1)
y <- sim(model,u,addNoise=TRUE)




