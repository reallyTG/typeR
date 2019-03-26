library(NPflow)


### Name: MLE_NiW_mmEM
### Title: EM MLE for mixture of NiW
### Aliases: MLE_NiW_mmEM

### ** Examples

set.seed(123)
U_mu <- list()
U_Sigma <- list()
U_nu<-list()
U_kappa<-list()

d <- 2
hyperG0 <- list()
hyperG0[["mu"]] <- rep(1,d)
hyperG0[["kappa"]] <- 0.01
hyperG0[["nu"]] <- d+1
hyperG0[["lambda"]] <- diag(d)

for(k in 1:200){

  NiW <- rNiW(hyperG0, diagVar=FALSE)
  U_mu[[k]] <-NiW[["mu"]]
  U_Sigma[[k]] <-NiW[["S"]]
}


hyperG02 <- list()
hyperG02[["mu"]] <- rep(2,d)
hyperG02[["kappa"]] <- 1
hyperG02[["nu"]] <- d+10
hyperG02[["lambda"]] <- diag(d)/10

for(k in 201:400){

  NiW <- rNiW(hyperG02, diagVar=FALSE)
  U_mu[[k]] <-NiW[["mu"]]
  U_Sigma[[k]] <-NiW[["S"]]
}


mle <- MLE_NiW_mmEM( U_mu, U_Sigma, hyperG0, K=2)

hyperG0[["mu"]]
hyperG02[["mu"]]
mle$U_mu

hyperG0[["lambda"]]
hyperG02[["lambda"]]
mle$U_lambda

hyperG0[["nu"]]
hyperG02[["nu"]]
mle$U_nu

hyperG0[["kappa"]]
hyperG02[["kappa"]]
mle$U_kappa



