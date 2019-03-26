library(gamlss)


### Name: par.plot
### Title: A function to plot parallel plot for repeated measurement data
### Aliases: par.plot
### Keywords: regression

### ** Examples


library(nlme)
data(Orthodont)
par.plot(distance~age,data=Orthodont,subject=Subject)
par.plot(distance~age|Sex,data=Orthodont,subject=Subject)
par.plot(distance~age|Subject,data=Orthodont,subject=Subject,show.given=FALSE)




