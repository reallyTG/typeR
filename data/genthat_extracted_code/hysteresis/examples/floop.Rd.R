library(hysteresis)


### Name: floop
### Title: Fit a Hysteresis Loop
### Aliases: floop floop2r
### Keywords: models

### ** Examples

### Simulate and fit a hysteresis loop with n=1 and m=3.
loopf <- mloop(sd.x=0.07,sd.y=0.05,n=3,m=3, retention=.5)
loopf.model <- floop(loopf$x,loopf$y,n=3,m=3)
loopf.model                #Gives estimate and delta standard errors
loopf.model$Estimates      #List estimates only  
loopf.model$Std.Errors     #List delta standard errors  

### Plot hysteresis loop.
plot(loopf.model,main="Simulated Hysteresis Loop n=3 m=3", values="hysteresis.all")
### Show characteristics of loop on plot
plot(loopf.model,main="Simulated Hysteresis Loop n=3 m=3",values="hysteresis.all",
show=c("retention","coercion"))
          
### Bootstrap estimates and standard errors (Seed is necessary if want to reproduce results)
booted.loopf <- floop(loopf$x,loopf$y,retention=.5,n=3,m=3,
boot=TRUE, seed=1523)
booted.loopf                   #Gives boot estimates, boot bias, boot SE and boot quartiles
booted.loopf$Boot.Estimates    #Gives boot estimates 
booted.loopf$Boot.Std.Errors   #Gives boot standard errors 
plot(booted.loopf,main="Simulated Bootstrapped Loop n=1, m=3",
putNumber=TRUE,values="hysteresis.all")




