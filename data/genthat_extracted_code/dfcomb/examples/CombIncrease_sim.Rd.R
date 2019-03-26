library(dfcomb)


### Name: CombIncrease_sim
### Title: Combination design Simulator using Logistic model
### Aliases: CombIncrease_sim print.CombIncrease_sim

### ** Examples

p_tox_sc1 = matrix(c(0.05,0.10,0.15,0.30,0.45,
                     0.10,0.15,0.30,0.45,0.55,
                     0.15,0.30,0.45,0.50,0.60),nrow=5,ncol=3)
p_tox_sc6 = matrix(c(0.05,0.08,0.10,0.13,0.15,
                     0.09,0.12,0.15,0.30,0.45,
                     0.15,0.30,0.45,0.50,0.60),nrow=5,ncol=3)
prior_a1 = c(0.12, 0.2, 0.3, 0.4, 0.5)
prior_a2 = c(0.2, 0.3, 0.4)

## No test: 
sim1 = CombIncrease_sim(ndose_a1=5, ndose_a2=3, p_tox=p_tox_sc1, target=0.30,
  target_min=0.20, target_max=0.40, prior_tox_a1=prior_a1, prior_tox_a2=prior_a2,
  n_cohort=20, cohort=3, tite=FALSE, nsim=2, c_e=0.85, c_d=0.45, c_stop=0.95,
  n_min=4, seed = 14061991)

sim1

sim2 = CombIncrease_sim(ndose_a1=5, ndose_a2=3, p_tox=p_tox_sc6, target=0.30,
  target_min=0.20, target_max=0.40, prior_tox_a1=prior_a1, prior_tox_a2=prior_a2,
  n_cohort=20, cohort=3, nsim=2)

sim2
## End(No test)

# Dummy example, running quickly
useless = CombIncrease_sim(ndose_a1=3, ndose_a2=2,
  p_tox=matrix(c(0.05,0.15,0.30,0.15,0.30,0.45),nrow=3), target=0.30,
  target_min=0.20, target_max=0.40, prior_tox_a1=c(0.2,0.3,0.4),
  prior_tox_a2=c(0.2,0.3), n_cohort=2, cohort=2, nsim=1)



