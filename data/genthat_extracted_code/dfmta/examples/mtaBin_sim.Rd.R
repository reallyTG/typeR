library(dfmta)


### Name: mtaBin_sim
### Title: Design Simulator for MTA with binary outcomes
### Aliases: mtaBin_sim print.mtaBin_sim

### ** Examples

p_tox_sc1 = c(0.005, 0.01, 0.02, 0.05, 0.10, 0.15)
p_eff_sc1_g1 = c(0.01, 0.10, 0.30, 0.50, 0.80, 0.80)
p_tox_sc2 = c(0.01, 0.05, 0.10, 0.25, 0.50, 0.70)
p_eff_sc2_g2 = matrix(c(0.40, 0.01, 0.40, 0.02, 0.40, 0.05, 0.40, 0.10, 0.40,
0.35, 0.40, 0.55), nrow=2)
prior_tox = c(0.02, 0.06, 0.12, 0.20, 0.30, 0.40)
prior_eff = c(0.12, 0.20, 0.30, 0.40, 0.50, 0.59)
prior_eff2 = rbind(prior_eff, prior_eff)
s_1=function(n_cur){0.2}
n=60

## No test: 
# With only one group and efficacy as time-to-event
sim1 = mtaBin_sim(ngroups=1, ndose=6, p_tox= p_tox_sc1, p_eff= p_eff_sc1_g1,
       tox_max=0.35, eff_min=0.20, prior_tox=prior_tox, prior_eff= prior_eff,
       poisson_rate=0.28, n=60, cohort_start=3, cohort=3, tite=TRUE,
       time_full=7, cycle=3, nsim=1)
sim1

# With only one group and efficacy binary
sim2 = mtaBin_sim(ngroups=1, ndose=6, p_tox= p_tox_sc1, p_eff= p_eff_sc1_g1,
       tox_max=0.35, eff_min=0.20, prior_tox=prior_tox, prior_eff= prior_eff,
       n=n, cohort_start=3, cohort=3, tite=FALSE, method="MTA-RA",
       s_1=function(n_cur){0.2*(1-n_cur/n)}, nsim=1)
sim2

# With only two groups and efficacy as time-to-event
sim3 = mtaBin_sim(ngroups=2, ndose=6, p_tox= p_tox_sc2, p_eff= p_eff_sc2_g2,
               tox_max=0.35, eff_min=0.20, prior_tox=prior_tox,
               prior_eff= prior_eff2, poisson_rate=c(0.40,0.25) , n=60,
               cohort_start=3, cohort=3, tite=TRUE, time_full=7,
               method="MTA-PM", s_2=0.07, cycle=3, nsim=1, c_tox=0.90,
               c_eff=0.40)
sim3
## End(No test)



