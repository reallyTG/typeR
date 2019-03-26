library(yuima)


### Name: qmleLevy
### Title: Gaussian quasi-likelihood estimation for Levy driven SDE
### Aliases: qmleLevy
### Keywords: ~kwd1 ~kwd2

### ** Examples

## One-dimensional case 
dri<-"-theta0*x" ## set drift
jum<-"theta1/(1+x^2)^(-1/2)" ## set jump
yuima<-setModel(drift = dri
                ,jump.coeff = jum
                ,solve.variable = "x",state.variable = "x"
                ,measure.type = "code"
                ,measure = list(df="rbgamma(z,1,sqrt(2),1,sqrt(2))")) ## set true model
n<-3000
T<-30 ## terminal
hn<-T/n ## stepsize

sam<-setSampling(Terminal = T, n=n) ## set sampling scheme
yuima<-setYuima(model = yuima, sampling = sam) ## model

true<-list(theta0 = 1,theta1 = 2) ## true values
upper<-list(theta0 = 4, theta1 = 4) ## set upper bound
lower<-list(theta0 = 0.5, theta1 = 1) ## set lower bound
set.seed(123)
yuima<-simulate(yuima, xinit = 0, true.parameter = true,sampling = sam) ## generate a path
start<-list(theta0 = runif(1,0.5,4), theta1 = runif(1,1,4)) ## set initial values
qmleLevy(yuima,start=start,lower=lower,upper=upper, joint = TRUE) 

## Multi-dimensional case

lambda<-1/2
alpha<-1
beta<-c(0,0)
mu<-c(0,0)
Lambda<-matrix(c(1,0,0,1),2,2) ## set parameters in noise

dri<-c("1-theta0*x1-x2","-theta1*x2")
jum<-matrix(c("x1*theta2+1","0","0","1"),2,2) ## set coefficients

yuima <- setModel(drift=dri, 
                 solve.variable=c("x1","x2"),state.variable = c("x1","x2"), 
                 jump.coeff=jum, measure.type="code",
                 measure=list(df="rvgamma(z, lambda, alpha, beta, mu, Lambda
                 )"))

n<-3000 ## the number of total samples
T<-30 ## terminal
hn<-T/n ## stepsize

sam<-setSampling(Terminal = T, n=n) ## set sampling scheme
yuima<-setYuima(model = yuima, sampling = sam) ## model

true<-list(theta0 = 1,theta1 = 2,theta2 = 3,lambda=lambda, alpha=alpha, 
beta=beta,mu=mu, Lambda=Lambda) ## true values
upper<-list(theta0 = 4, theta1 = 4, theta2 = 5) ## set upper bound
lower<-list(theta0 = 0.5, theta1 = 1, theta2 = 1) ## set lower bound
set.seed(123)
yuima<-simulate(yuima, xinit = c(0,0), true.parameter = true,sampling = sam) ## generate a path
plot(yuima)
start<-list(theta0 = runif(1,0.5,4), theta1 = runif(1,1,4), 
theta2 = runif(1,1,5)) ## set initial values
qmleLevy(yuima,start=start,lower=lower,upper=upper,joint = FALSE,third=TRUE) 



