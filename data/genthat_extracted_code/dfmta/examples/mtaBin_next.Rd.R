library(dfmta)


### Name: mtaBin_next
### Title: Optimal dose determination for MTA with binary outcomes
### Aliases: mtaBin_next print.mtaBin_next

### ** Examples

prior_tox = c(0.02, 0.06, 0.12, 0.20, 0.30, 0.40)
prior_eff = c(0.12, 0.20, 0.30, 0.40, 0.50, 0.59)
group_pat_1 = rep(1,33)
id_dose_1 = c(1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,4,4,4,5,5,5,6,6,6,3,3,3,4,4,4,3,3,3)
tox_1 = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0)
time_follow_1 = c(rep(7,30),6.8,5,3.5)
time_eff_1 = c(rep(+Inf,8),4,+Inf,+Inf,+Inf,3,6,+Inf,+Inf,2,+Inf,+Inf,4.5,+Inf,
+Inf,3.2,+Inf,+Inf,2.4,6.1,+Inf,5.8,+Inf,+Inf,2.1,3.6)
eff_2 = c(0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1)
group_pat_3 = c(1,2,3,2,1,2,3,1,2,3,3,2,2,1,3,1,2,3,1,2,3,3,3,2,1,1,2,1,2,2)
id_dose_3 = c(1,1,1,1,1,1,1,1,2,1,2,2,2,2,2,2,3,2,2,3,3,3,3,3,1,1,2,1,2,2)
toxicity_3 = c(0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0)
efficacy_3 = c(NA,0,NA,0,NA,1,NA,NA,0,NA,NA,1,0,NA,NA,NA,0,NA,NA,1,NA,NA,NA,
0,NA,NA,0,NA,1,1)
s_1=function(n_cur){0.2*(1-n_cur/60)}

## No test: 
# One group, time-to-event
mta1 = mtaBin_next(ngroups=1, group_cur=1, ndose=6, prior_tox=prior_tox,
       prior_eff=prior_eff, tox_max=0.35, eff_min=0.20, cohort_start=3,
       cohort=3, method="MTA-PM", group_pat=group_pat_1, id_dose=id_dose_1,
       toxicity=tox_1, tite=TRUE, time_follow=time_follow_1,
       time_eff=time_eff_1, time_full=7, cycle=3, c_tox=0.90, c_eff=0.40)
mta1

# One group, binary
mta2 = mtaBin_next(ngroups=1, group_cur=1, ndose=6, prior_tox=prior_tox,
       prior_eff=prior_eff, tox_max=0.35, eff_min=0.20, cohort_start=3,
       cohort=3, final = TRUE, method="MTA-RA", group_pat=group_pat_1,
       id_dose=id_dose_1, toxicity=tox_1, tite=FALSE, efficacy=eff_2,
       seed = 190714)
mta2

# Three groups, binary
mta3 = mtaBin_next(ngroups=3, group_cur=2, ndose=6, prior_tox=prior_tox,
       prior_eff=prior_eff, tox_max=0.35, eff_min=0.20, cohort_start=3,
       cohort=3, final = FALSE, s_1=s_1, group_pat=group_pat_3,
       id_dose=id_dose_3, toxicity=toxicity_3, tite=FALSE, efficacy=efficacy_3)
mta3
## End(No test)

# Dummy example, running quickly
useless = mtaBin_next(ngroups=1, group_cur=1, ndose=4,
          prior_tox=c(0.12,0.20,0.30,0.40), prior_eff=c(0.20,0.30,0.40,0.50),
          tox_max=0.35, eff_min=0.20, cohort_start=3, cohort=3,
          group_pat=rep(1,9), id_dose=c(1,1,1,2,2,2,2,2,2),
          toxicity=c(0,0,0,1,0,0,0,0,0), efficacy=c(0,0,0,0,0,1,0,1,0), tite=FALSE)



