library(hysteresis)


### Name: residuals.fittedloop
### Title: Residuals, studentized residuals and fitted values for the
###   hysteresis package.
### Aliases: residuals.ellipsefit residuals.ellipsesummary
###   residuals.fittedloop residuals.loopsummary residuals.ellipsefitlist
###   residuals.ellipsesummarylist residuals.fittedlooplist
###   residuals.loopsummarylist residuals.fittedlooplist2r
###   residuals.loopsummarylist2r residuals.loop2r residuals.loop2rsummary
###   rstudent.ellipsefit rstudent.ellipsesummary rstudent.fittedloop
###   rstudent.loopsummary rstudent.ellipsefitlist
###   rstudent.ellipsesummarylist rstudent.fittedlooplist
###   rstudent.loopsummarylist rstudent.fittedlooplist2r
###   rstudent.loopsummarylist2r rstudent.loop2r rstudent.loop2rsummary
###   fitted.ellipsefit fitted.ellipsesummary fitted.fittedloop
###   fitted.loopsummary fitted.ellipsefitlist fitted.ellipsesummarylist
###   fitted.fittedlooplist fitted.loopsummarylist fitted.fittedlooplist2r
###   fitted.loopsummarylist2r fitted.loop2r fitted.loop2rsummary
### Keywords: models

### ** Examples

##For multiple loops/ellipses
data(HysteresisData)
Mloopmodels.rep <- floop.repeated(HysteresisData$X, HysteresisData$Y,
n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A","C"),
repeated=HysteresisData$repeated)
Mloopmodels.rep                #Gives estimates and delta standard errors
residuals(Mloopmodels.rep)  #$input $output $geometric 
fitted(Mloopmodels.rep)     #$input $output
scatterplotMatrix(cbind(residuals(Mloopmodels.rep)$input,
residuals(Mloopmodels.rep)$output,residuals(Mloopmodels.rep)$geometric,
fitted(Mloopmodels.rep)$input,fitted(Mloopmodels.rep)$output),
  main='Residuals for Multiple Hysteresis Loops',smooth=FALSE,
  var.labels=c("Input Resid","Output Resid","Geometric Resid",
  "Fitted Input", "Fitted Output"),
  groups=residuals(Mloopmodels.rep)$repeated)
rstudent(Mloopmodels.rep)  #$input $output
scatterplotMatrix(cbind(rstudent(Mloopmodels.rep)$input,
rstudent(Mloopmodels.rep)$output,fitted(Mloopmodels.rep)$input,
fitted(Mloopmodels.rep)$output),main='Studentized Residuals 
for Multiple Hysteresis Loops',smooth=FALSE,
var.labels=c("Input Resid","Output Resid", "Fitted Input",
"Fitted Output"),groups=residuals(Mloopmodels.rep)$repeated)

##For single Ellipse
ellipse1 <- mel(sd.x=0.2,sd.y=0.04)
ellipse1.fit <- fel(ellipse1$x,ellipse1$y)
residuals(ellipse1.fit)
fitted(ellipse1.fit)
scatterplotMatrix(cbind(residuals(ellipse1.fit)$input,
residuals(ellipse1.fit)$output,residuals(ellipse1.fit)$geometric,
fitted(ellipse1.fit)$input,fitted(ellipse1.fit)$output),
main='Residuals for Simulated Ellipse',smooth=FALSE,
var.labels=c("Input Resid","Output Resid","Geometric Resid", 
"Fitted Input", "Fitted Output"))

rstudent(ellipse1.fit) #for input and output variables
scatterplotMatrix(cbind(rstudent(ellipse1.fit)$input,
rstudent(ellipse1.fit)$output,fitted(ellipse1.fit)$input,
fitted(ellipse1.fit)$output),main='Studentized Residuals
for Simulated Ellipse',smooth=FALSE,
var.labels=c("Input Resid","Output Resid","Fitted Input",
"Fitted Output"))

plot(ellipse1.fit$pred.y,rstudent(ellipse1.fit)$output,
xlab="Fitted Output",ylab="Output Studentized Residuals",
main="Studentized Residuals:Simulated Ellipse")
abline(h = 0, lty = 2, col = "gray")
qqnorm(rstudent(ellipse1.fit)$output,sub='Output Studentized
Residuals Simulated Ellipse')
qqline(rstudent(ellipse1.fit)$output,col="red") #q-q line



