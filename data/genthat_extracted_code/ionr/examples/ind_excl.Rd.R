library(ionr)


### Name: ind_excl
### Title: Wrapper and scripts for indicator exclusion procedure
### Aliases: ind_excl

### ** Examples

### Create a scale-outcome set that violates IOn_ Only 2 indicators out of 8
### relate to the outcome, the others just relate to the 2 indicators. This setting is
### similar to the N5: Impulsiveness - BMI association in Vainik et al (2015) EJP paper.
set.seed(466)
a<-scale_sim(n=2500, to_n=2, tn_n=6)
# Last 2 indicators have considerably higher correlation with the outcome
ind_excl(a[[1]], outcome=a[[2]], pcrit=0.0037)

## boostrapped confidence intervals
ind_excl(a[[1]], outcome=a[[2]], pcrit=0.0037, ci=100)

# no confidence intervals
ind_excl(a[[1]], outcome=a[[2]], pcrit=0.0037, ci="no")

## include covariates in the model
covx=rnorm(2500)
covy=rnorm(2500)
outcome=a[[2]]+0.3*covx+0.4*covy
covars=data.frame(covx=covx, covy=covy)

# ind_excl() with covariates taken into account
ind_excl(a[[1]],outcome=outcome,covars=covars, pcrit=0.0037)

#effect sizes are lower when noisy covariatse are not accounted for
ind_excl(a[[1]],outcome=outcome, pcrit=0.0037)

# just a single covariate also needs to be in data frame

covx=rnorm(2500)
outcome=a[[2]]+0.3*covx
covars=data.frame(covx=covx)

ind_excl(a[[1]],outcome=outcome,covars=covars, pcrit=0.0037)

### Create a scale-outcome set that has ION, all 8 indicators relate to the outcome
set.seed(466)
b<-scale_sim(n=2500, to_n=8, cor_to_outcome = 0.35)
# All indicators correlate largely on the same level with the outcome.
ind_excl(b[[1]], outcome=b[[2]], pcrit=1.7*10^-4)

#note that using cor_to_outcome=0.25, sometimes still indicators get wrongly flagged.
# Here, the method could probably be improved..

### Create a scale-outcome set that violates ION - only 1 indicator relates to the
### outcome. Include other-report.
set.seed(466)
c<-scale_sim(n=2500, to_n=1, tn_n=7, indicators2=TRUE)
# Last indicator has considerably higher correlation with the outcome
ind_excl(c[[1]], c[[3]], outcome=c[[2]], pcrit=0.0037)



