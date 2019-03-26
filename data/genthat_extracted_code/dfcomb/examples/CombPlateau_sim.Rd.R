library(dfcomb)


### Name: CombPlateau_sim
### Title: Combination design Simulator for the combination of two agents
###   where toxicity is increasing with the dose of both agent and efficacy
###   is increasing and possibly plateaus with the dose of one agent
### Aliases: CombPlateau_sim print.CombPlateau_sim

### ** Examples

p_tox_sc1 = t(matrix(c(0.10,0.15,0.30,0.45,
                     0.15,0.30,0.45,0.50,
                     0.30,0.45,0.55,0.65),nrow=4,ncol=3))
p_eff_sc1 = t(matrix(c(0.25,0.25,0.26,0.27,
                     0.40,0.41,0.41,0.42,
                     0.55,0.55,0.56,0.56),nrow=4,ncol=3))
p_tox_sc4 = t(matrix(c(0.01,0.04,0.08,0.10,
                     0.03,0.05,0.10,0.15,
                     0.07,0.10,0.15,0.30),nrow=4,ncol=3))
p_eff_sc4 = t(matrix(c(0.05,0.20,0.30,0.32,
                     0.10,0.30,0.45,0.46,
                     0.20,0.40,0.60,0.61),nrow=4,ncol=3))
prior_tox_a1 = c(0.2, 0.3, 0.4)
prior_eff_a1 = c(0.3, 0.4, 0.5)
prior_tox_a2 = c(0.12, 0.2, 0.3, 0.4)
prior_eff_a2 = c(0.3, 0.4, 0.5, 0.59)

## No test: 
sim1 = CombPlateau_sim(ndose_a1=3, ndose_a2=4, p_tox=p_tox_sc1,
  p_eff=p_eff_sc1, tox_max=0.30, eff_min=0.20, prior_tox_a1=prior_tox_a1,
  prior_tox_a2=prior_tox_a2, prior_eff_a1=prior_eff_a1,
  prior_eff_a2=prior_eff_a2, n=75, cohort_start=3, cohort=3, time_full=7,
  poisson_rate=0.28, cycle=0, nsim=2000, c_tox=0.85, c_eff=0.10, seed = 2174892,
  threads=0)

sim1

sim2 = CombPlateau_sim(ndose_a1=3, ndose_a2=4, p_tox=p_tox_sc4,
  p_eff=p_eff_sc4, tox_max=0.30, eff_min=0.20, prior_tox_a1=prior_tox_a1,
  prior_tox_a2=prior_tox_a2, prior_eff_a1=prior_eff_a1,
  prior_eff_a2=prior_eff_a2, n=75, cohort=3, time_full=7, poisson_rate=0.28,
  nsim=1000)

sim2
## End(No test)

# Dummy example, running quickly
useless = CombPlateau_sim(ndose_a1=2, ndose_a2=2,
  p_tox=matrix(c(0.05,0.10,0.15,0.25),nrow=2),
  p_eff=matrix(c(0.10,0.35,0.30,0.65),nrow=2), tox_max=0.35, eff_min=0.20,
  prior_tox_a1=c(0.1,0.3), prior_tox_a2=c(0.1,0.3), prior_eff_a1=c(0.2,0.4),
  prior_eff_a2=c(0.2,0.4),
  n=15, cohort=3, time_full=7, poisson_rate=1, nsim=1)



