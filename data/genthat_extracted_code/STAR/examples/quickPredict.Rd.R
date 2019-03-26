library(STAR)


### Name: quickPredict
### Title: A Simple Interface to predict method for ssanova and ssanova0
###   objects
### Aliases: quickPredict %qp%
### Keywords: models smooth regression

### ** Examples

## Follow up of ssanova example of gss
data(nox)
nox.fit <- ssanova(log10(nox)~comp*equi,data=nox)
## get prediction for the first term, comp
comp.pred <- quickPredict(nox.fit)
## plot result with method plot for quickPredict objects
plot(comp.pred)
## get prediction for the second term, equi using the binary version
equi.pred <- nox.fit %qp% "equi"
plot(equi.pred)
## get prediction for the interaction term, comp:equi
comp.equi.pred <- nox.fit %qp% "comp:equi"
## use image method image
image(comp.equi.pred)
## use contour method
contour(comp.equi.pred,col=2,lwd=2,labcex=1.5)
contour(comp.equi.pred,what="sd",lty=3,labcex=1.2,add=TRUE)
## use persp method
persp(comp.equi.pred,theta=-10,phi=20)



