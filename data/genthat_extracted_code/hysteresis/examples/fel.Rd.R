library(hysteresis)


### Name: fel
### Title: Fitting Ellipses
### Aliases: fel
### Keywords: models

### ** Examples

### Simulate and fit a Single ellipse.
Sellipse <- mel(method=2,sd.x=0.2,sd.y=0.04)
Sellipse.fit <- fel(Sellipse$x,Sellipse$y)
Sellipse.fit  #Gives estimates, delta standard errors and 95% CI
Sellipse.fit$Estimates  

### Bootstrap estimates and standard errors (Seed is necessary if want to reproduce results)
booted.Sellipse <- fel(Sellipse$x,Sellipse$y,boot=TRUE, seed=123)
booted.Sellipse   #Gives boot estimates, boot bias, boot SE and boot quartiles
plot(booted.Sellipse,main="Simulated Bootstrap Ellipse Loop",xlab="X Input",
ylab="Y Output",values="ellipse.all")




