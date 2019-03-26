library(NHPoisson)


### Name: graphResCov.fun
### Title: Lurking variable plots of a set of variables
### Aliases: graphResCov.fun

### ** Examples




#Simulated process without any relationship with variables Y1 and Y2
#The plots are performed dividing the  variables into  50 intervals
#Raw residuals. 

X1<-rnorm(500)
X2<-rnorm(500)
auxmlePP<-fitPP.fun(posE=round(runif(50,1,500)), inddat=rep(1,500),
	covariates=cbind(X1,X2),start=list(b0=1,b1=0,b2=0))

Y1<-rnorm(500)
Y2<-rnorm(500)
res<-graphResCov.fun(mlePP=auxmlePP, Xvar=cbind(Y1,Y2), nint=50,  
	typeRes="Raw",namX=c("Y1","Y2"),plotDisp=c(2,1))

#If more variables were specified in the argument Xvar, with
#the same 2X1 layout specified in plotDisp, the resulting plots could be 
#scrolled up and down with the "Page Up" and "Page Down" keys.




