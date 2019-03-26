library(psych)


### Name: structure.diagram
### Title: Draw a structural equation model specified by two measurement
###   models and a structural model
### Aliases: structure.diagram structure.graph structure.sem lavaan.diagram
###   sem.diagram sem.graph
### Keywords: multivariate hplot

### ** Examples


#A set of measurement and structural models
#First set up the various matrices
fx <-  matrix(c(.9,.8,.7,rep(0,9), .6,.7,-.8,rep(0,9),.5,.6,.4),ncol=3)
fy <- matrix(c(.9,.8,.6,rep(0,4),.6,.8,-.7),ncol=2)
Phi <- matrix(c(1,.35,0,0,0,
                .35,1,.5,0,0,
                0,.5, 1,0,0,
                .7,-.6, 0, 1,0,
                .0, 0, .4,0,1 ),ncol=5,byrow=TRUE)
#now draw a number of models 
f1 <- structure.diagram(fx,main = "A measurement model for x")
f2 <- structure.diagram(fx,Phi, main = "A measurement model for x")  
f3 <- structure.diagram(fy=fy, main = "A measurement model for y") 
f4 <- structure.diagram(fx,Phi,fy,main="A structural path diagram")            
f5 <- structure.diagram(fx,Phi,fy,main="A structural path diagram",errors=TRUE)

#a mimic model
fy <- matrix(c(.9,.8,.6,rep(0,4),.6,.8,-.7),ncol=2)
fx <- matrix(c(.6,.5,0,.4),ncol=2)
mimic <- structure.diagram(fx,fy=fy,simple=FALSE,errors=TRUE, main="A mimic diagram")

fy <- matrix(c(rep(.9,8),rep(0,16),rep(.8,8)),ncol=2)
structure.diagram(fx,fy=fy)

#symbolic input
X2 <- matrix(c("a",0,0,"b","e1",0,0,"e2"),ncol=4)
colnames(X2) <- c("X1","X2","E1","E2")
phi2 <- diag(1,4,4)
phi2[2,1] <- phi2[1,2] <- "r"
f2 <- structure.diagram(X2,Phi=phi2,errors=FALSE,main="A symbolic model") 

#symbolic input with error 
X2 <- matrix(c("a",0,0,"b"),ncol=2)
colnames(X2) <- c("X1","X2")
phi2 <- diag(1,2,2)
phi2[2,1] <- phi2[1,2] <- "r"
f3 <- structure.diagram(X2,Phi=phi2,main="an alternative representation",e.size=.4)

#and yet another one
X6 <- matrix(c("a","b","c",rep(0,6),"d","e","f"),nrow=6)
colnames(X6) <- c("L1","L2")
rownames(X6) <- c("x1","x2","x3","x4","x5","x6")
Y3 <- matrix(c("u","w","z"),ncol=1)
colnames(Y3) <- "Y"
rownames(Y3) <- c("y1","y2","y3")
phi21 <- matrix(c(1,0,"r1",0,1,"r2",0,0,1),ncol=3)
colnames(phi21) <- rownames(phi21) <-  c("L1","L2","Y")
f4 <- structure.diagram(X6,phi21,Y3)

###the following example is not run but is included to show how to work with lavaan
if(FALSE) {
library(lavaan)
mod.1 <- 'A =~ A1 + A2 + A3 + A4 + A5
         C =~ C1 + C2 + C3 + C4 + C5
         E =~ E1 +E2 + E3 + E4 +E5'
fit.1 <- sem(mod.1,bfi[complete.cases(bfi),],std.lv=TRUE)
lavaan.diagram(fit.1)

#compare with
f3 <- fa(bfi[complete.cases(bfi),1:15],3)
fa.diagram(f3)
         
mod.3 <- 'A =~ A1 + A2 + A3 + A4 + A5
         C =~ C1 + C2 + C3 + C4 + C5
         E =~ E1 +E2 + E3 + E4 +E5
         A ~ age + gender
         C ~ age + gender
         E ~ age + gender'

fit.3 <- sem(mod.3,bfi[complete.cases(bfi),],std.lv=TRUE)
lavaan.diagram(fit.3, cut=0,simple=FALSE,main="mimic model")
}
# and finally, a regression model
X7 <- matrix(c("a","b","c","d","e","f"),nrow=6)
f5 <- structure.diagram(X7,regression=TRUE,main = "Regression model")

#and a really messy regession model
x8 <- c("b1","b2","b3")
r8 <- matrix(c(1,"r12","r13","r12",1,"r23","r13","r23",1),ncol=3)
f6<- structure.diagram(x8,Phi=r8,regression=TRUE,main="Regression model")



