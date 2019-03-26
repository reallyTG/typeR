library(fourPNO)


### Name: Gibbs_2PNO
### Title: Gibbs Implementation of 2PNO
### Aliases: Gibbs_2PNO

### ** Examples

require(fourPNO)
# simulate small 2PNO dataset to demonstrate function
J = 5
N = 100

# Population item parameters
as_t = rnorm(J,mean=2,sd=.5)
bs_t = rnorm(J,mean=0,sd=.5)
   
# Sampling gs and ss with truncation
gs_t = rbeta(J,1,8)
ps_g = pbeta(1-gs_t,1,8)
ss_t = qbeta(runif(J)*ps_g,1,8)
theta_t = rnorm(N)
Y_t = Y_4pno_simulate(N,J,as=as_t,bs=bs_t,gs=gs_t,ss=ss_t,theta=theta_t)
   
# Setting prior parameters
mu_theta = 0
Sigma_theta_inv = 1
mu_xi = c(0,0)
alpha_c = alpha_s = beta_c = beta_s = 1
Sigma_xi_inv = solve(2*matrix(c(1,0,0,1), 2, 2))
burnin = 1000

# Execute Gibbs sampler. This should take about 15.5 minutes
out_t <- Gibbs_4PNO(Y_t,mu_xi,Sigma_xi_inv,mu_theta,Sigma_theta_inv,alpha_c,beta_c,alpha_s,
                    beta_s,burnin,rep(1,J),rep(1,J),gwg_reps=5,chain_length=burnin*2)
       
# Summarizing posterior distribution
OUT = cbind(apply(out_t$AS[,-c(1:burnin)],1,mean),apply(out_t$BS[,-c(1:burnin)],1,mean),
        apply(out_t$GS[,-c(1:burnin)],1,mean),apply(out_t$SS[,-c(1:burnin)],1,mean),
        apply(out_t$AS[,-c(1:burnin)],1,sd),apply(out_t$BS[,-c(1:burnin)],1,sd),
        apply(out_t$GS[,-c(1:burnin)],1,sd),apply(out_t$SS[,-c(1:burnin)],1,sd) )
OUT = cbind(1:J, OUT)
colnames(OUT) = c('Item','as','bs','gs','ss','as_sd','bs_sd','gs_sd','ss_sd')
print(OUT, digits=3)



