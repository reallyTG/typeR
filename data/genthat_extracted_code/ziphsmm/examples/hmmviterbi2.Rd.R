library(ziphsmm)


### Name: hmmviterbi2
### Title: Viterbi algorithm to decode the latent states in hidden Markov
###   models with covariate values
### Aliases: hmmviterbi2

### ** Examples

data(CAT)
y <- CAT$activity
x <- data.matrix(CAT$night)
prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,50,100)
zero_init <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
fit2 <-  hmmfit(y,rep(1440,3),3,prior_init,omega,
     emit_init,zero_init, emit_x=x,zeroinfl_x=x,hessian=FALSE,
     method="Nelder-Mead", control=list(maxit=500,trace=1))
decode <- hmmviterbi2(y,rep(1440,3),3,fit2$working_parameters,zero_init=c(1,0,0),
            emit_x=x,zeroinfl_x=x, plot=TRUE, xlab="time", ylab="count",
            xlim=c(0,360),ylim=c(0,200))





