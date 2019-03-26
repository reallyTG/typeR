library(mhsmm)


### Name: hsmmfit
### Title: fit a hidden semi-Markov model
### Aliases: hsmmfit

### ** Examples

J <- 3
init <- c(0,0,1)
P <- matrix(c(0,.1,.4,.5,0,.6,.5,.9,0),nrow=J)
B <- list(mu=c(10,15,20),sigma=c(2,1,1.5))
d <- list(lambda=c(10,30,60),shift=c(10,100,30),type='poisson')
model <- hsmmspec(init,P,parms.emission=B,sojourn=d,dens.emission=dnorm.hsmm)
train <- simulate(model,r=rnorm.hsmm,nsim=100,seed=123456)
plot(train,xlim=c(0,400))
start.poisson <- hsmmspec(init=rep(1/J,J),
  transition=matrix(c(0,.5,.5,.5,0,.5,.5,.5,0),nrow=J),
  parms.emission=list(mu=c(4,12,23),
		sigma=c(1,1,1)),
  sojourn=list(lambda=c(9,25,40),shift=c(5,95,45),type='poisson'),
 dens.emission=dnorm.hsmm)

M=500
# not run (takes some time)
# h.poisson <- hsmmfit(train,start.poisson,mstep=mstep.norm,M=M)
# plot(h.poisson$loglik,type='b',ylab='Log-likelihood',xlab='Iteration') ##has it converged?
# summary(h.poisson)
# predicted <- predict(h.poisson,train)  
# table(train$s,predicted$s) ##classification matrix
# mean(predicted$s!=train$s) ##misclassification rate

d <- cbind(dunif(1:M,0,50),dunif(1:M,100,175),dunif(1:M,50,130))
start.np <- hsmmspec(init=rep(1/J,J),
  transition=matrix(c(0,.5,.5,.5,0,.5,.5,.5,0),nrow=J),
  parms.emission=list(mu=c(4,12,23),
  sigma=c(1,1,1)),
  sojourn=list(d=d,type='nonparametric'),
  dens.emission=dnorm.hsmm)
# not run (takes some time)
# h.np <- hsmmfit(train,start.np,mstep=mstep.norm,M=M,graphical=TRUE)
# mean(predicted$s!=train$s) ##misclassification rate


#J <- 2
#init <- c(1, 0)
#P <- matrix(c(0, 1, 1, 0), nrow = J)
#B <- list(mu = list(c(2, 3), c(3, 4)), sigma = list(matrix(c(4, 2, 2, 3), ncol = 2), diag(2)))
#d <- list(shape = c(10, 25), scale = c(2, 2), type = "gamma")
#model <- hsmmspec(init, P, parms.emis = B, sojourn = d, dens.emis = dmvnorm.hsmm)
#train <- simulate(model, c(1000,100), seed = 123, rand.emis = rmvnorm.hsmm)

#yhat <- predict(model, train)
#mean(predict(model,train)$s==train$s)





