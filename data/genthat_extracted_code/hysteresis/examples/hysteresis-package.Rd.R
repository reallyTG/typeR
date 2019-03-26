library(hysteresis)


### Name: hysteresis-package
### Title: Modeling Rate-Dependent Hysteretic Processes
### Aliases: hysteresis-package hysteresis
### Keywords: package

### ** Examples

###Take a look at the vignette.
#browseURL(system.file('doc/index.html',package='hysteresis'))

### Simulate and fit a hysteresis loop with m=3 and n=5.
 loop1 <- mloop(sd.x=0.05,sd.y=0.05,n=5,m=3)
 model <- floop(loop1$x,loop1$y,n=5,m=3)
 model                #Gives estimate with delta standard errors
 model$Estimates      #Gives estimates  
 model$Std.Errors     #Lists delta standard errors  
 
### Plot hysteresis loop.
 plot(model,main="Simulated Hysteresis Loop n=5 m=3")

### Bootstrap estimates and standard errors (Seed is necessary if want to reproduce results)
 booted.loop <- floop(loop1$x,loop1$y,,n=5,m=3,boot=TRUE, seed=1523)
 booted.loop                   #Gives boot estimates, boot bias, boot SE and boot quartiles
 booted.loop$Boot.Estimates    #Gives boot estimates 
 booted.loop$Boot.Std.Errors   #Gives boot standard errors 
plot(booted.loop,main="Simulated Bootstrapped Loop n=5, m=3",putNumber=TRUE)


### Simulate and fit an ellipse.
ellipse1 <- mel(sd.x=0.2,sd.y=0.04)
ellipse1.fit <- fel(ellipse1$x,ellipse1$y)
ellipse1.fit             #Gives estimates with delta standard errors and 95%CI
ellipse1.fit$Estimates      #Gives all estimates 
ellipse1.fit$Std.Errors     #Lists delta standard errors  

### Plot ellipse
plot(ellipse1.fit,xlab="Input",ylab="Output",main="Simulated Ellipse")

### Bootstrap estimates and standard errors (Seed is necessary if want to reproduce results)
booted.ellipse <- fel(ellipse1$x,ellipse1$y,boot=TRUE, seed=123)
booted.ellipse                 #Gives boot estimates, boot bias, boot SE and boot quartiles
booted.ellipse$Boot.Estimates  #Gives boot estimates   
booted.ellipse$Boot.Std.Errors #Gives boot standard errors




