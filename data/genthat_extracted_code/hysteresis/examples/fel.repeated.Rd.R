library(hysteresis)


### Name: fel.repeated
### Title: Methods for easily fitting multiple ellipses from repeated
###   measures designs.
### Aliases: fel.repeated summary.ellipsefitlist
### Keywords: models

### ** Examples

## Select 2 subjects with 2 replications and fit 4 ellipses
data(EllipseData) 
emodels.rep <- fel.repeated(EllipseData$X, EllipseData$Y, method = "harmonic2", 
subjects = EllipseData$subjects,subjects.in=c("A","C"),
repeated=EllipseData$repeated)
emodels.rep                #Gives estimates and delta standard errors 
emodels.rep$Estimates      #List estimates only
emodels.rep$Std.Errors     #List delta standard errors 
par(mfrow=c(2,2))
plot(emodels.rep, main="Repeated Ellipses",xlab="X",ylab="Y")
par(mfrow=c(1,1))

### Bootstrap estimates and standard errors (Seed is necessary if want to reproduce results)
boot.rep.ellipse<-fel.repeated(EllipseData$X,EllipseData$Y,method = "harmonic2",
subjects = EllipseData$subjects,subjects.in=c("A","C"),
repeated=EllipseData$repeated,boot=TRUE,seed=123)
boot.rep.ellipse  #Gives boot estimates, boot bias, boot SE and boot quartiles
par(mfrow=c(2,2))
plot(boot.rep.ellipse, main="Repeated Ellipses",xlab="X",ylab="Y",values="ellipse")
par(mfrow=c(1,1))

##Can write results to a file. First set your directory from the file tab.
#Change file path in command below to coincide with where you want to store data files
#setwd("C:/Users................")
#write.table(boot.rep.ellipse$Boot.Estimates,"Ellipes.eg.repbootvalues.txt")
#test.fel=read.table("Ellipes.eg.repbootvalues.txt",header=TRUE)
#head(test.fel)



