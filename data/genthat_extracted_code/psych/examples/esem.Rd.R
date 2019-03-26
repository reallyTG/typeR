library(psych)


### Name: esem
### Title: Perform and Exploratory Structural Equation Model (ESEM) by
###   using factor extension techniques
### Aliases: esem esem.diagram interbattery
### Keywords: multivariate models

### ** Examples

#make up a sem like problem using sim.structure
fx <-matrix(c( .9,.8,.6,rep(0,4),.6,.8,-.7),ncol=2)  
fy <- matrix(c(.6,.5,.4),ncol=1)
rownames(fx) <- c("V","Q","A","nach","Anx")
rownames(fy)<- c("gpa","Pre","MA")
Phi <-matrix( c(1,0,.7,.0,1,.7,.7,.7,1),ncol=3)
gre.gpa <- sim.structural(fx,Phi,fy)
print(gre.gpa)

#now esem it:
example <- esem(gre.gpa$model,varsX=1:5,varsY=6:8,nfX=2,nfY=1,n.obs=1000,plot=FALSE)
example
esem.diagram(example,simple=FALSE)

#compare two alternative solutions to the first 2 factors of the neo.
#solution 1 is the normal 2 factor solution.
#solution 2 is an esem with 1 factor for the first 6 variables, and 1 for the second 6.
f2 <- fa(neo[1:12,1:12],2)
es2 <- esem(neo,1:6,7:12,1,1)
summary(f2)
summary(es2)
fa.congruence(f2,es2)

interbattery(Thurstone.9,1:4,5:9,2,2)  #compare to the solution of Tucker.  We are not there yet.




