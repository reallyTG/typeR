library(dfcomb)


### Name: CombIncrease_next
### Title: Combination determination with logistic model
### Aliases: CombIncrease_next print.CombIncrease_next

### ** Examples

prior_a1 = c(0.12, 0.2, 0.3, 0.4, 0.5)
prior_a2 = c(0.2, 0.3, 0.4)
toxicity1 = c(0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1)
dose1 = c(1,1,1,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4)
dose2 = c(1,1,1,2,2,2,3,3,3,2,2,2,1,1,1,1,1,1)
t_tox = c(rep(+Inf,8),2.9,+Inf,4.6,+Inf,+Inf,+Inf,+Inf,+Inf,+Inf,5.2)
follow = c(rep(6,15), 4.9, 3.1, 1.3)

next1 = CombIncrease_next(ndose_a1=5, ndose_a2=3, target=0.3, target_min=0.20,
  target_max=0.40, prior_tox_a1=prior_a1, prior_tox_a2=prior_a2, final=FALSE,
  pat_incl=18, dose_adm1=dose1, dose_adm2=dose2, tite=FALSE, toxicity=toxicity1,
  n_min=6)

next1

next2 =CombIncrease_next(ndose_a1=5, ndose_a2=3, target=0.30, target_min=0.20,
  target_max=0.40, prior_tox_a1=prior_a1, prior_tox_a2=prior_a2, final=FALSE,
  pat_incl=18, dose_adm1=dose1, dose_adm2=dose2, tite=TRUE, time_full=6,
  time_tox=t_tox, time_follow=follow, n_min=6)

next2



