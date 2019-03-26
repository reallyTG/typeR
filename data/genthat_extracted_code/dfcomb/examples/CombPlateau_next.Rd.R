library(dfcomb)


### Name: CombPlateau_next
### Title: Combination determination for the combination of two agents
###   where toxicity is increasing with the dose of both agent and efficacy
###   is increasing and possibly plateaus with the dose of one agent
### Aliases: CombPlateau_next print.CombPlateau_next

### ** Examples

prior_tox_a1 = c(0.2, 0.3, 0.4)
prior_eff_a1 = c(0.3, 0.4, 0.5)
prior_tox_a2 = c(0.12, 0.2, 0.3, 0.4)
prior_eff_a2 = c(0.3, 0.4, 0.5, 0.59)
toxicity = c(0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0)
dose1 = c(1,1,1,1,1,1,2,2,2,3,3,3,3,3,3,2,2,2)
dose2 = c(1,1,1,2,2,2,1,1,1,1,1,1,1,1,1,2,2,2)
t_prog = c(1.6,4.2,3.5,5.1,2.4,4.8,2.8,4.4,+Inf,3.9,+Inf,4.6,1.8,+Inf,0.5,5.4,2.8,+Inf)
follow = c(rep(7,15), 4.9, 3.1, 1.3)

next1 = CombPlateau_next(ndose_a1=3, ndose_a2=4, tox_max=0.30, eff_min=0.20,
  prior_tox_a1, prior_tox_a2, prior_eff_a1, prior_eff_a2, stage=0, in_startup=FALSE,
  cohort=3, pat_incl=18, dose_adm1=dose1, dose_adm2=dose2, toxicity=toxicity,
  time_full=7, time_prog=t_prog, time_follow=follow)

next1



