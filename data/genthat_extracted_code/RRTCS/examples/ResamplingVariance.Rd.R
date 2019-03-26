library(RRTCS)


### Name: ResamplingVariance
### Title: Resampling variance of randomized response models
### Aliases: ResamplingVariance
### Keywords: Campbell_Berger_Skinner Escobar_Berger Jackknife
###   Randomized_response Resampling Variance

### ** Examples

N=417
data(ChaudhuriChristofidesData)
dat=with(ChaudhuriChristofidesData,data.frame(z,Pi))
mu=c(6,6)
sigma=sqrt(c(10,10))
cl=0.95
data(ChaudhuriChristofidesDatapij)
out=ChaudhuriChristofides(dat$z,mu,sigma,dat$Pi,"mean",cl,pij=ChaudhuriChristofidesDatapij)
out
ResamplingVariance(out,dat$Pi,"mean",2,N,ChaudhuriChristofidesDatapij)

#Resampling with strata
data(EichhornHayreData)
dat=with(EichhornHayreData,data.frame(ST,z,Pi))
mu=1.111111
sigma=0.5414886
cl=0.95
out=EichhornHayre(dat$z,mu,sigma,dat$Pi,"mean",cl)
out
ResamplingVariance(out,dat$Pi,"mean",1,str=dat$ST)

#Resampling with cluster
N=1500
data(SoberanisCruzData)
dat=with(SoberanisCruzData, data.frame(CL,z,Pi))
p=0.7
alpha=0.5
cl=0.90
out=SoberanisCruz(dat$z,p,alpha,dat$Pi,"total",cl)
out
ResamplingVariance(out,dat$Pi,"total",2,N,samplingVarEst::Pkl.Hajek.s(dat$Pi))

#Resampling with strata and cluster
N=1500
data(HorvitzDataStCl)
dat=with(HorvitzDataStCl, data.frame(ST,CL,z,Pi))
p=0.6
alpha=0.5
cl=0.95
out=Horvitz(dat$z,p,alpha,dat$Pi,"mean",cl,N)
out
ResamplingVariance(out,dat$Pi,"mean",3,N,samplingVarEst::Pkl.Hajek.s(dat$Pi))



