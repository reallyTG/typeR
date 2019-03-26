library(CircNNTSR)


### Name: CircNNTSR-package
### Title: CircNNTSR: An R Package for the statistical analysis of circular
###   data using nonnegative trigonometric sums (NNTS) models
### Aliases: CircNNTSR-package CircNNTSR
### Keywords: package

### ** Examples

a<-c(runif(10,3*pi/2,2*pi-0.00000001),runif(10,pi/2,pi-0.00000001))
#Estimation of the NNTSdensity with 2 components for data and 1000 iterations
est<-nntsmanifoldnewtonestimation(a,2,1000)
#plot the estimated density
nntsplot(est$cestimates[,2],2)

data(Turtles_radians)
#Empirical analysis of data
Turtles_hist<-hist(Turtles_radians,breaks=10,freq=FALSE)
#Estimation of the NNTS density with 3 componentes for data
est<-nntsmanifoldnewtonestimation(Turtles_radians,3)
est
#plot the estimated density
nntsplot(est$cestimates[,2],3)
#add the histogram to the estimated density plot
plot(Turtles_hist, freq=FALSE, add=TRUE)

b<-c(runif(10,3*pi/2,2*pi-0.00000001),runif(10,pi/2,pi-0.00000001))
estS<-nntsestimationSymmetric(2,b)
nntsplotSymmetric(estS$coef,2)

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est
cest<-est$cestimates
mnntsplot(cest, M)

data(Datab6fisher_ready)
data<-Datab6fisher_ready
M<-c(4,4)
cpars<-rnorm(prod(M+1))+rnorm(prod(M+1))*complex(real=0,imaginary=1)
cpars[1]<-Re(cpars[1])
cpars<- cpars/sqrt(sum(Mod(cpars)^2))
snntsdensity(data, cpars, M)
snntsloglik(data, cpars, M)

data(Datab6fisher_ready)
data<-Datab6fisher_ready
M<-c(1,2)
cest<-snntsmanifoldnewtonestimation(data, M)
lat<-snntsmarginallatitude(seq(0,pi,.1),cest$cestimates[,3],M)
plot(seq(0,pi,.1),lat,type="l")





