library(acid)


### Name: midks.plot
### Title: Plot Comparing Parametric and Empirical Cumulative Density
###   Functions
### Aliases: midks.plot

### ** Examples

# parameter values
pi0.s<-0.2
pi1.s<-0.1
thres0.s<-0
thres1.s<-25000
mu.s<-20000
sigma.s<-5
nu.s<-0.5
tau.s<-1
x.seq<-seq(0,200000,by=1000)

# generate sample
n<-100
s<-as.data.frame(matrix(NA,n,3))
names(s)<-c("cat","y","w")
s[,1]<-sample(1:3,n,replace=TRUE,prob=c(pi0.s,pi1.s,1-pi0.s-pi1.s))
s[,3]<-rep(1,n)
for(i in 1:n){
  if(s$cat[i]==1){s$y[i]<-0
  }else if(s$cat[i]==2){s$y[i]<-runif(1,thres0.s,thres1.s)
  }else s$y[i]<-rGB2(1,mu=mu.s,sigma=sigma.s,nu=nu.s,tau=tau.s)+thres1.s
}
# display
midks.plot(x.seq,s$y,dist=cdf.mix.dag,pi0=pi0.s,thres0=thres0.s,pi1=pi1.s,
thres1=thres1.s,mu=mu.s,sigma=sigma.s,nu=nu.s,tau=tau.s)





