library(hmm.discnp)


### Name: misstify
### Title: Insert missing values.
### Aliases: misstify
### Keywords: datagen

### ** Examples

P <- matrix(c(0.7,0.3,0.1,0.9),2,2,byrow=TRUE)
R <- matrix(c(0.5,0,0.1,0.1,0.3,
              0.1,0.1,0,0.3,0.5),5,2)
set.seed(42)
lll   <- sample(250:350,20,TRUE)
y     <- rhmm(ylengths=lll,nsim=1,tpm=P,Rho=R,drop=TRUE)
y     <- misstify(y,nafrac=0.5,fep=list(present=TRUE))



