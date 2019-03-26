library(BayesTree)


### Name: pdbart
### Title: Partial Dependence Plots for BART
### Aliases: pdbart plot.pdbart pd2bart plot.pd2bart
### Keywords: nonparametric tree regression nonlinear dplot

### ** Examples

##simulate data 
f = function(x) { return(.5*x[,1] + 2*x[,2]*x[,3]) }
sigma=.2 # y = f(x) + sigma*z
n=100 #number of observations
set.seed(27)
x = matrix(2*runif(n*3)-1,ncol=3) ; colnames(x) = c('rob','hugh','ed')
Ey = f(x)
y = Ey +  sigma*rnorm(n)
lmFit = lm(y~.,data.frame(x,y)) #compare lm fit to BART later
par(mfrow=c(1,3)) #first two for pdbart, third for pd2bart
##pdbart: one dimensional partial dependence plot
set.seed(99)
pdb1 = pdbart(x,y,xind=c(1,2),
   levs=list(seq(-1,1,.2),seq(-1,1,.2)),pl=FALSE,
   keepevery=10,ntree=100,nskip=100,ndpost=200) #should run longer!
plot(pdb1,ylim=c(-.6,.6))
##pd2bart: two dimensional partial dependence plot
set.seed(99)
pdb2 = pd2bart(x,y,xind=c(2,3),
   levquants=c(.05,.1,.25,.5,.75,.9,.95),pl=FALSE,
   ntree=100,keepevery=10,verbose=FALSE,nskip=100,ndpost=200) #should run longer!
plot(pdb2)
##compare BART fit to linear model and truth = Ey
fitmat = cbind(y,Ey,lmFit$fitted,pdb1$yhat.train.mean)
colnames(fitmat) = c('y','Ey','lm','bart')
print(cor(fitmat))
## plot.bart(pdb1) displays the BART run used to get the plot.



