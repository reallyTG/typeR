library(KFAS)


### Name: fitSSM
### Title: Maximum Likelihood Estimation of a State Space Model
### Aliases: fitSSM

### ** Examples


# Example function for updating covariance matrices H and Q
# (also used as a default function in fitSSM)

updatefn <- function(pars, model){
  if(any(is.na(model$Q))){
    Q <- as.matrix(model$Q[,,1])
    naQd  <- which(is.na(diag(Q)))
    naQnd <- which(upper.tri(Q[naQd,naQd]) & is.na(Q[naQd,naQd]))
    Q[naQd,naQd][lower.tri(Q[naQd,naQd])] <- 0
    diag(Q)[naQd] <- exp(0.5 * pars[1:length(naQd)])
    Q[naQd,naQd][naQnd] <- pars[length(naQd)+1:length(naQnd)]
    model$Q[naQd,naQd,1] <- crossprod(Q[naQd,naQd])
  }
 if(!identical(model$H,'Omitted') && any(is.na(model$H))){#'
   H<-as.matrix(model$H[,,1])
   naHd  <- which(is.na(diag(H)))
   naHnd <- which(upper.tri(H[naHd,naHd]) & is.na(H[naHd,naHd]))
   H[naHd,naHd][lower.tri(H[naHd,naHd])] <- 0
   diag(H)[naHd] <-
     exp(0.5 * pars[length(naQd)+length(naQnd)+1:length(naHd)])
   H[naHd,naHd][naHnd] <-
     pars[length(naQd)+length(naQnd)+length(naHd)+1:length(naHnd)]
   model$H[naHd,naHd,1] <- crossprod(H[naHd,naHd])
   }
 model
}

# Example function for checking the validity of covariance matrices.

checkfn <- function(model){
  #test positive semidefiniteness of H and Q
  inherits(try(ldl(model$H[,,1]),TRUE),'try-error') ||
  inherits(try(ldl(model$Q[,,1]),TRUE),'try-error')
}


model <- SSModel(Nile ~ SSMtrend(1, Q = list(matrix(NA))), H = matrix(NA))

#function for updating the model
update_model <- function(pars, model) {
  model["H"] <- pars[1]
  model["Q"] <- pars[2]
  model
}

#check that variances are non-negative
check_model <- function(model) {
  (model["H"] > 0 && model["Q"] > 0)
}

fit <- fitSSM(inits = rep(var(Nile)/5, 2), model = model,
                 updatefn = update_model, checkfn = check_model)



