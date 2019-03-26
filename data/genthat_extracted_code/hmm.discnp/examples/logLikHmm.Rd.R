library(hmm.discnp)


### Name: logLikHmm
### Title: Log likelihood of a hidden Markov model
### Aliases: logLikHmm
### Keywords: models

### ** Examples

# TO DO:  One or more bivariate examples.
P <- matrix(c(0.7,0.3,0.1,0.9),2,2,byrow=TRUE)
R <- matrix(c(0.5,0,0.1,0.1,0.3,
              0.1,0.1,0,0.3,0.5),5,2)
set.seed(42)
lll   <- sample(250:350,20,TRUE)
y.num <- rhmm(ylengths=lll,nsim=1,tpm=P,Rho=R,drop=TRUE)
y.let <- rhmm(ylengths=lll,nsim=1,tpm=P,Rho=R,yval=letters[1:5],drop=TRUE)
ll1   <- logLikHmm(y.num,tpm=P,Rho=R,warn=FALSE)
row.names(R) <- letters[1:5]
ll2   <- logLikHmm(y.let,tpm=P,Rho=R)
# Note: ll2 differs from ll1 since y.num and y.let were
# simulated from different random seeds.
ll3   <- logLikHmm(y.let,tpm=P,Rho=R,ispd=c(0.5,0.5))
fit   <- hmm(y.num,K=2,itmax=10)
ll4   <- logLikHmm(y.num,fit) # Use the fitted rather than the "true" parameters.



