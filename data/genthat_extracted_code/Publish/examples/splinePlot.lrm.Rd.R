library(Publish)


### Name: splinePlot.lrm
### Title: Plot predictions of logistic regression
### Aliases: splinePlot.lrm

### ** Examples

data(Diabetes)
Diabetes$hypertension=  1*(Diabetes$bp.1s>140)
library(rms)
uu <- datadist(Diabetes)
options(datadist="uu")
fit=lrm(hypertension~rcs(age)+gender+hdl,data=Diabetes)
splinePlot.lrm(fit,xvar="age",xvalues=seq(30,50,1))



