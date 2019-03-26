library(nomogramEx)


### Name: nomogramEx
### Title: Extract Equations from a Nomogram
### Aliases: nomogramEx
### Keywords: nomogram, survival probability

### ** Examples

if(require("rms")){
n <-1000
age <- rnorm(n,50,10)
sex <- factor(sample(c('female','male'),n,TRUE))
sex <- as.numeric(sex)
ddist <- datadist(age,sex)
options(datadist='ddist')
cens <- 15*runif(n)
time <- -log(runif(n))/0.02*exp(.04*(age-50)+.8*(sex=='Female'))
death <- ifelse(time <= cens,1,0)
time <- pmin(time,cens)
units(time)="month"
f <- cph(formula(Surv(time,death)~sex+age),x=TRUE,y=TRUE,surv=TRUE,time.inc=3)
surv <- Survival(f)
nomo <- nomogram(f, fun=list(function(x) surv(3,x),function(x) surv(6,x)),
  lp=TRUE,funlabel=c("3-Month Survival Prob","6-Month Survival Prob"))
nomogramEx(nomo=nomo,np=2,digit=9)
}



