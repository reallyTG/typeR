library(NHPoisson)


### Name: graphresU.fun
### Title: Validation analysis of PP uniform (generalized) residuals
### Aliases: graphresU.fun

### ** Examples


#Since  only one graphical device is opened  and the argument histWgraph 
#is TRUE by default, the resulting residual plots  (three pages with the 
#considered 1X2 layout for the residual versus variables plot)   
#can be scrolled up and down with the "Page Up" and "Page Down" keys.

X1<-rnorm(500)
X2<-rnorm(500)

graphresU.fun(unires=runif(30,0,1),posE=round(runif(30,0,500)), 
  Xvariables=cbind(X1,X2), namXv=c("X1","X2"),tit="Example",flow=0.7,plotDisp=c(1,2))




