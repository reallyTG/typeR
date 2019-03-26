library(hyper.fit)


### Name: hyper.sigcor
### Title: Function to convert from biased sample sigma to unbiased
###   population sigma
### Aliases: hyper.sigcor
### Keywords: fit utility sigma bias sample population

### ** Examples

#The below will take *a long* time to run- of the order a few days for the LD tests.
## Not run: 
##D Ngen=1e3
##D sdsamp=3
##D testvec=c(5,10,20,50,100)
##D 
##D set.seed(650)
##D 
##D fittestmean={}
##D for(Nsamp in testvec){
##D   print(paste('Nsamp=', Nsamp))
##D   fittest=matrix(0, nrow=Ngen, ncol=3)
##D   for(i in 1:Ngen){
##D     if(i ##D 
##D     mockx=runif(Nsamp, -100, 100)
##D     mocky=mockx*tan(45*pi/180)+rnorm(Nsamp, sd=sdsamp)
##D     fittest[i,]=hyper.fit(X=cbind(mockx,mocky), coord.type='theta', scat.type='vert.axis')$parm
##D   }
##D   convtest2dOpt=rbind(convtest2dOpt, c(N=Nsamp,Raw=mean(fittest[,3]),
##D   mean(fittest[,3])*hyper.sigcor(Nsamp, 2)))
##D }
##D 
##D fittestmeanLD={}
##D for(Nsamp in testvec){
##D   print(paste('Nsamp=', Nsamp))
##D   fittest=matrix(0, nrow=Ngen, ncol=3)
##D   for(i in 1:Ngen){
##D     if(i ##D 
##D     mockx=runif(Nsamp, -100, 100)
##D     mocky=mockx*tan(45*pi/180)+rnorm(Nsamp, sd=sdsamp)
##D     fittest[i,]=hyper.fit(X=cbind(mockx,mocky), coord.type='theta', scat.type='vert.axis',
##D     algo.func='LD', algo.method='GG', Specs=list(Grid=seq(-0.1,0.1, len=5), dparm=NULL,
##D     CPUs=1, Packages=NULL, Dyn.libs=NULL))$parm
##D     print(fittest[i,])
##D   }
##D   convtest2dLD=rbind(convtest2dLD, c(N=Nsamp, Raw=mean(fittest[,3]),
##D   mean(fittest[,3])*hyper.sigcor(Nsamp, 2)))
##D }
##D 
##D normtestmean={}
##D for(Nsamp in testvec){
##D   print(paste('Nsamp=', Nsamp))
##D   normtest={}
##D   for(i in 1:Ngen){
##D     if(i ##D 
##D     normtemp=rnorm(Nsamp, sd=sdsamp)
##D     normtest=c(normtest, sqrt(sum((normtemp-mean(normtemp))^2)/Nsamp))
##D   }
##D   convtest1dNorm=rbind(convtest1dNorm, c(N=Nsamp, Raw=mean(normtest),
##D   mean(normtest)*hyper.sigcor(Nsamp, 1)))
##D }
## End(Not run)
#The runs above have been pre-generated and can be loaded via

data(convtest2dOpt)
data(convtest2dLD)
data(convtest1dNorm)

magplot(convtest2dOpt[,c('N','Raw')],xlim=c(5,100),ylim=c(0,4),type='b',log='x')
lines(convtest2dOpt[,c('N','sampbias2popunbias')],type='b',lty=2,pch=4)
lines(convtest2dLD[,c('N','Raw')],type='b',col='blue')
lines(convtest2dLD[,c('N','bias2unbias')],type='b',lty=2,pch=4,col='blue')
lines(convtest1dNorm[,c('N','Raw')],type='b',col='red')
lines(convtest1dNorm[,c('N','sampbias2popunbias')],type='b',lty=2,pch=4,col='red')
legend('topleft', legend=c('2 DoF and optim fit','2 DoF and LD fit', '1 DoF and direct SD'),
col=c('black','blue','red'),pch=1)
legend('topright', legend=c('Raw intrinsic scatter', 'Corrected intrinsic scatter'),
lty=c(1,2))



