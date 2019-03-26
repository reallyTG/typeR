library(hysteresis)


### Name: floop.repeated
### Title: Methods for easily fitting multiple loops from repeated measures
###   designs.
### Aliases: floop.repeated summary.fittedlooplist floop2r.repeated
###   summary.fittedlooplist2r
### Keywords: models

### ** Examples

data(HysteresisData)
loopmodels.rep <- floop.repeated(HysteresisData$X, HysteresisData$Y,
n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A","C"),
repeated=HysteresisData$repeated)
loopmodels.rep                #Gives estimates and delta standard errors
loopmodels.rep$Estimates      #List estimates only
loopmodels.rep$Std.Errors     #List delta standard errors

par(mfrow=c(2,2))
plot(loopmodels.rep,main='Simulated Rep Loops',values="hysteresis")
par(mfrow=c(1,1))

loopmodels.rep$models["A",1]       #Select one subject, one replication

### Bootstrap estimates and standard errors (Seed is necessary if want to reproduce results)
boot.rep.loop=floop.repeated(HysteresisData$X, HysteresisData$Y,
n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A","C"),
repeated=HysteresisData$repeated,boot=TRUE,seed=123)
boot.rep.loop                 #Gives boot estimates, boot bias, boot SE and boot quartiles
boot.rep.loop$Boot.Estimates  #Lists boot estimates
boot.rep.loop$Boot.Std.Errors #Gives boot standard errors 

par(mfrow=c(2,2))
plot(boot.rep.loop, main='Simulated Rep Boot Loops', values="hysteresis")
par(mfrow=c(1,1))

##Can write results to a file. First set your directory from the file tab.
## Change file path in command below to coincide with where you want to store data files
##setwd("C:/Users/..........................")
##write.table(boot.rep.loop$Boot.Estimates,"Hys.eg.repbootvalues.txt")
##test.floop=read.table("Hys.eg.repbootvalues.txt",header=TRUE)
##head(test.floop)



