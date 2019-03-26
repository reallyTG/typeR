library(multivator)


### Name: betahat
### Title: Various intermediate expressions needed by the multivariate
###   emulator
### Aliases: beta_hat betahat_mult betahat_mult_Sigma cstar regressor
###   var.matrix eq2.36 eq2.36_Sigma

### ** Examples


data(mtoys)

H <- regressor(toy_mm, toy_LoF)
Sigma <- var.matrix(toy_mm, hp=toy_mhp)
Sigmainv <- solve(Sigma)


jj <- toy_mm_maker(34,35,36)
expt  <- experiment(jj,obs_maker(jj,toy_mhp,toy_LoF,toy_beta))

x1 <- jj[c(20,40,100),]
xold(x1) <- 0.2

x2 <- jj[c(11,21:24,40:42),]
xold(x2) <- xold(x2)+0.1

#primary function of package:
multem(x=x1, expt, hp=toy_mhp, LoF=toy_LoF)

# conditional covariance matrix:
cstar(x1,x2, expt, hp=toy_mhp, LoF=toy_LoF)
 



