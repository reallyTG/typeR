## ------------------------------------------------------------------------
x3 = function(x){
 return(x^3)
}
y = rjmcmc::adiff(x3, c(5,6))
attr(y, "gradient")

## ------------------------------------------------------------------------
dgomp = function(t, A, b, c){ A*exp(-b*exp(-c*t)) }
dbert = function(t, L, t0, k){ L*(1-exp(-k*(t+t0))) }

## ------------------------------------------------------------------------
L1 = function(theta){ sum(dnorm(y, dgomp(t, theta[1], theta[2], theta[3]),
                               1/sqrt(theta[4]), log=TRUE)) }
L2 = function(theta){ sum(dnorm(y, dbert(t, theta[1], theta[2], theta[3]),
                               1/sqrt(theta[4]), log=TRUE)) }

## ------------------------------------------------------------------------
g2 = function(psi){ return(theta=psi) }
ginv2 = function(theta){ return(psi=theta) }

## ------------------------------------------------------------------------
g1 = function(psi){
  temp = exp(-psi[2]*psi[3])
  c(psi[1],
    -log(1-temp),
    -log((log(1-temp*exp(-psi[3]*tstar))) / (log(1-temp)))/tstar,
    psi[4])
}
ginv1 = function(theta){
  temp = -log((exp(-theta[2]*exp(-theta[3]*tstar))-1)
              / (exp(-theta[2])-1))/tstar
  c(theta[1],
    -log(1-exp(-theta[2]))/temp,
    temp,
    theta[4])
}

## ------------------------------------------------------------------------
p.prior = function(theta){
  sum(dnorm(theta[1:3], 0, 1/sqrt(c(1e-6, 0.05, 1)), log=T)) +
  dgamma(theta[4], 0.01, 0.01, log=T)
}

## ----echo=FALSE----------------------------------------------------------
load("codas.RData")
set.seed(337)

## ----message=FALSE-------------------------------------------------------
library("rjmcmc")
getsampler(C1, "draw1")
getsampler(C2, "draw2", order=c(2, 3, 1, 4))

## ----message=FALSE-------------------------------------------------------
data("Croaker2", package="FSAdata")
CroakerM = Croaker2[which(Croaker2$sex=="M"),]
y = CroakerM$tl; t = CroakerM$age
tstar = 6

growth = rjmcmcpost(post.draw = list(draw1,draw2), g = list(g1,g2),
               ginv = list(ginv1,ginv2), likelihood = list(L1,L2),
               param.prior = list(p.prior,p.prior),
               model.prior = c(0.7,0.3), chainlength = 5000,
               progress = FALSE)
growth$result

## ----echo=FALSE----------------------------------------------------------
load("results.RData")

## ----message=FALSE-------------------------------------------------------
growthDef = defaultpost(posterior = list(C1, C2[,c(2,3,1,4)]),
                        likelihood = list(L1, L2),
                        param.prior = list(p.prior, p.prior),
                        model.prior = c(0.5,0.5), 
                        chainlength = 5000, progress = FALSE)
growthDef$result

## ------------------------------------------------------------------------
L1 = function(theta){
  pr = plogis(theta[f])
  sum(dbinom(X, N, pr, log=T))
}

L2 = function(theta){
  pr = plogis(theta[f] + theta[5:25])
  sum(dbinom(X, N, pr, log=T))
}

L3 = function(theta){
  pr = plogis(theta[5:25])
  sum(dbinom(X, N, pr, log=T))
}

## ------------------------------------------------------------------------
prior1 = function(theta){
  sum(dnorm(theta[1:4], 0, 1/sqrt(theta[26]), log=T)) +
  sum(dnorm(theta[5:25], mu[2,5:25], sig[2,5:25], log=T))
}

prior2 = function(theta){
  sum(dnorm(theta[1:25], 0, 1/sqrt(2*theta[26]), log=T))
}

prior3 = function(theta){
  sum(dnorm(theta[1:4], mu[2,1:4], sig[2,1:4], log=T)) +
  sum(dnorm(theta[5:25], 0, 1/sqrt(theta[26]), log=T))
}

## ------------------------------------------------------------------------
g1 = function(psi){
  theta = c(mu[1,1:4] + sig[1,1:4]/sig[2,1:4] *(psi[1:4] - mu[2,1:4]),
            psi[5:26])  # u5,...,u25 and V follow identity map
}
ginv1 = function(theta){
  psi = c(mu[2,1:4] + sig[2,1:4]/sig[1,1:4] *(theta[1:4] - mu[1,1:4]),
          theta[5:26])
}

g2 = function(psi){ psi }
ginv2 = function(theta){ theta }

g3 = function(psi){
  theta = c(psi[1:4],
            mu[3,5:25] + sig[3,5:25]/sig[2,5:25]*(psi[5:25] - mu[2,5:25]),
            psi[26])
}
ginv3 = function(theta){
  psi = c(theta[1:4],
          mu[2,5:25] + sig[2,5:25]/sig[3,5:25]*(theta[5:25] - mu[3,5:25]),
          theta[26])
}

## ----echo=FALSE----------------------------------------------------------
f = c(rep(2,5), rep(1,6), rep(4,5), rep(3,5))
X = c(10, 23, 23, 26, 17, 5, 53, 55, 32, 46, 10, 8, 10, 8, 23, 0, 3, 22, 15, 32, 3)
N = c(39, 62, 81, 51, 39, 6, 74, 72, 51, 79, 13, 16, 30, 28, 45, 4, 12, 41, 30, 51, 7)
getsampler(coda1, "draw1")
getsampler(coda2, "draw2")
getsampler(coda3, "draw3")

## ----message=FALSE-------------------------------------------------------
seeds = rjmcmcpost(post.draw = list(draw1, draw2, draw3),
                   likelihood = list(L1, L2, L3), 
                   g = list(g1, g2, g3), 
                   ginv = list(ginv1, ginv2, ginv3),
                   param.prior = list(prior1, prior2, prior3),
                   model.prior = c(0.011, 0.028, 0.961), 
                   chainlength = 5000, progress = FALSE)
seeds$result

## ----eval=FALSE----------------------------------------------------------
#  cat("model{
#      for(ti in 1:10){
#        mu[ti] <- A*exp(-b*exp(-c*ti))
#      }
#      for(i in 1:n){
#        y[i] ~ dnorm(mu[t[i]], tau)
#      }
#      A ~ dnorm(0, 0.00001)T(0,)  #
#      b ~ dnorm(0, 0.05)T(0,)     # precision = 1/variance
#      c ~ dnorm(0, 1)T(0,)        #
#      tau ~ dgamma(0.01, 0.01)
#    }", file="fishGomp.txt")
#  
#  cat("model{
#      for(ti in 1:10){
#        mu[ti] <- L*(1-exp(-k*(ti+t0)))
#      }
#      for(i in 1:n){
#        y[i] ~ dnorm(mu[t[i]], tau)
#      }
#      L ~ dnorm(0, 0.000001)T(0,)
#      t0 ~ dnorm(0, 0.05)T(0,)
#      k ~ dnorm(0, 1)T(0,)
#      tau ~ dgamma(0.01, 0.01)
#    }", file="fishBert.txt")

## ----eval=FALSE----------------------------------------------------------
#  ## Gompertz model
#  inits = function(){list(A = abs(rnorm(1, 350, 200)), b = abs(rnorm(1, 2, 3)),
#                          c = abs(rnorm(1, 1, 2)), tau = rgamma(1, 0.1, 0.1))}
#  params = c("A", "b", "c", "tau")
#  jagsfit1 = jags(data = c('y', 't', 'n'), inits, params, n.iter=1e5,
#                  n.thin=20, model.file = "fishGomp.txt")
#  C1 = as.matrix(as.mcmc(jagsfit1))[,-4]
#  
#  ## von Bertalanffy model
#  inits = function(){list(L = abs(rnorm(1, 350, 200)), t0 = abs(rnorm(1, 2, 3)),
#                          k = abs(rnorm(1, 1, 2)), tau = rgamma(1, 0.1, 0.1))}
#  params = c("L", "t0", "k", "tau")
#  jagsfit2 = jags(data = c('y', 't', 'n'), inits, params, n.iter=1e5,
#                  n.thin=20, model.file = "fishBert.txt")
#  C2 = as.matrix(as.mcmc(jagsfit1))[,-1]

## ----eval=FALSE----------------------------------------------------------
#  cat("model{
#      for(i in 1:21) {
#        X[i] ~ dbin(p[i],N[i])
#        logit(p[i]) <- beta[f[i]]
#      }
#      for(j in 1:4){
#        beta[j] ~ dnorm(0, V)  # precision, not variance
#      }
#      V ~ dgamma(3.29, 7.80)
#    }", file="model1.txt")

## ----eval=FALSE----------------------------------------------------------
#  ## Fit Model 1
#  jags1 = jags(data = c('N', 'X', 'f'), param=c('beta', 'V'), n.iter=n.i,
#               n.burnin=n.burn, model.file = "model1.txt")
#  fit1 = as.mcmc(jags1); coda1 = as.matrix(fit1)[,-5]
#  
#  ## Fit Model 2
#  jags2 = jags(data = c('N', 'X', 'f'), param=c('beta', 'eps', 'V'), n.iter=n.i,
#               n.burnin=n.burn, model.file = "model2.txt")
#  fit2 = as.mcmc(jags2); coda2 = as.matrix(fit2)[,-5]
#  
#  ## Fit Model 3
#  jags3 = jags(data = c('N', 'X'), param=c('eta', 'V'), n.iter=n.i,
#               n.burnin=n.burn, model.file = "model3.txt")
#  fit3 = as.mcmc(jags3); coda3 = as.matrix(fit3)[,-1]
#  
#  ## Re-order codas to match order in manuscript
#  coda2 = coda2[,c(1:5, 16, 19:25, 6:15, 17:18, 26)]
#  coda3 = coda3[,c(1, 12, 15:21, 2:11, 13:14, 22)]
#  
#  ## Calculate posterior means and standard deviations
#  mu = sig = matrix(NA, 3, 25)
#  for(j in 1:25){
#    mu[2,j] = mean(coda2[,j])
#    sig[2,j] = sd(coda2[,j])
#    if(j<=4){
#      mu[1,j] = mean(coda1[,j])
#      sig[1,j] = sd(coda1[,j])
#    } else {
#      mu[3,j] = mean(coda3[,j-4])
#      sig[3,j] = sd(coda3[,j-4])
#    }
#  }
#  
#  ## attach posteriors for augmenting variables to codas
#  lcoda = dim(coda1)[1]
#  u1_4 = matrix(rnorm(lcoda*4, mu[2,1:4], sig[2,1:4]), lcoda, 4, byrow=T)
#  u21_25 = matrix(rnorm(lcoda*21, mu[2,5:25], sig[2,5:25]), lcoda, 21, byrow=T)
#  coda1 = cbind(coda1[,1:4], u21_25, coda1[,5])
#  coda3 = cbind(u1_4, coda3)
#  
#  ## Define functions to randomly sample from posterior
#  getsampler(coda1, "draw1")
#  getsampler(coda2, "draw2")
#  getsampler(coda3, "draw3")

