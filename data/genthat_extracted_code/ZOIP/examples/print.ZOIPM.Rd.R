library(ZOIP)


### Name: print.ZOIPM
### Title: print.ZOIPM
### Aliases: print.ZOIPM

### ** Examples


library(ZOIP)

N<-2
ni<-10
set.seed(12345)
Ciudad <- rep(1:N, each=ni)
Total_mora<-rexp(N*ni,rate=1)
set.seed(12345)
b0i <- rep(rnorm(n=N,sd=0.5), each=ni)
set.seed(12345)
b1i <- rep(rnorm(n=N,sd=0.4), each=ni)

neta <- (-1.13+b0i)+0.33*Total_mora
neta2<-(0.33+b1i)+0.14*Total_mora

mu <- 1 / (1 + exp(-neta))
sigma <- 1 / (1 + exp(-neta2))

p0 <- 0.05
p1 <- 0.05

mu[mu==1] <- 0.999
mu[mu==0] <- 0.001

sigma[sigma==1] <- 0.999
sigma[sigma==0] <- 0.001
family<-'R-S'
set.seed(12345)
Y <- rZOIP(n=length(mu), mu = mu, sigma = sigma ,p0=p0,p1=p1,family=family)

data_sim<-data.frame(Y,Total_mora,Ciudad)

n.points <- 3
pruning <- TRUE

formula.mu=Y~Total_mora
formula.sigma=~Total_mora
formula.p0=~1
formula.p1=~1
formula.random= ~ 1 | Ciudad
link=c('logit','logit','identity','identity')
optimizer<-'nlminb'
## No test: 
mod<-RMM.ZOIP(formula.mu=formula.mu,formula.sigma=formula.sigma,formula.p0=formula.p0,
              formula.p1=formula.p1,data=data_sim,formula.random=formula.random,link=link,
              family=family,optimizer=optimizer,n.points=n.points,pruning=pruning)
mod
## End(No test)




