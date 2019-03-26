library(tcgsaseq)


### Name: vc_score_h_perm
### Title: Computes variance component test statistic for homogeneous
###   trajectory
### Aliases: vc_score_h_perm
### Keywords: internal

### ** Examples

rm(list=ls())
set.seed(123)

##generate some fake data
########################
ng <- 100
nindiv <- 30
nt <- 5
nsample <- nindiv*nt
tim <- matrix(rep(1:nt), nindiv, ncol=1, nrow=nsample)
tim <- cbind(tim, tim^2)
sigma <- 5
b0 <- 10

#under the null:
beta1 <- rnorm(n=ng, 0, sd=0)
#under the (heterogen) alternative:
beta1 <- rnorm(n=ng, 0, sd=0.1)
#under the (homogen) alternative:
beta1 <- rnorm(n=ng, 0.06, sd=0)

y.tilde <- b0 + rnorm(ng, sd = sigma)
y <- t(matrix(rep(y.tilde, nsample), ncol=ng, nrow=nsample, byrow=TRUE) +
      matrix(rep(beta1, each=nsample), ncol=ng, nrow=nsample, byrow=FALSE)*matrix(rep(tim, ng),
                                                            ncol=ng, nrow=nsample, byrow=FALSE) +
      matrix(rnorm(ng*nsample, sd = sigma), ncol=ng, nrow=nsample, byrow=FALSE)
      )
myindiv <- rep(1:nindiv, each=nt)
x <- cbind(1, myindiv/2==floor(myindiv/2))
myw <- matrix(rnorm(nsample*ng, sd=0.1), ncol=nsample, nrow=ng)

#run test
#We only use few permutations (10) to keep example running time low
#Otherwise one can use n_perm = 1000
score_homogen <- vc_score_h_perm(y, x, phi=tim, indiv=myindiv,
                                w=myw, Sigma_xi=cov(tim), n_perm = 10)
score_homogen$score

score_heterogen <- vc_score_perm(y, x, phi=tim, indiv=myindiv,
                           w=myw, Sigma_xi=cov(tim), n_perm = 10)
score_heterogen$score

scoreTest_homogen <- vc_test_asym(y, x, phi=tim, indiv=rep(1:nindiv, each=nt),
                                 w=matrix(1, ncol=ncol(y), nrow=nrow(y)), Sigma_xi=cov(tim),
                                 homogen_traj = TRUE)
scoreTest_homogen$set_pval
scoreTest_heterogen <- vc_test_asym(y, x, phi=tim, indiv=rep(1:nindiv, each=nt),
                                   w=matrix(1, ncol=ncol(y), nrow=nrow(y)), Sigma_xi=cov(tim),
                                   homogen_traj = FALSE)
scoreTest_heterogen$set_pval




