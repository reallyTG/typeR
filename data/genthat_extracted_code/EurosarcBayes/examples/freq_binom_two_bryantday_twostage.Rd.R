library(EurosarcBayes)


### Name: freq_binom_two_bryantday_twostage
### Title: Single arm, two independent endpoint extension to Simons
###   two-stage design
### Aliases: freq_binom_two_bryantday_twostage

### ** Examples


r1=0.3
r0=0.1
t0=0.3
t1=0.1

power=0.8
alpha=0.1

###############################################################
# Bryant and Day, two stage
nrange=20:27
out=freq_binom_two_bryantday_twostage(r0,r1,t0,t1,alpha,power,nrange)

###############################################################
## Frequentist simulations
# modelled toxicity probability
t=c(0.1,0.3,0.1,0.3)
# modelled response probability
r=c(0.3,0.1,0.1,0.3)

## Bayesian uniform prior
pra=1;prb=1;pta=1;ptb=1
## bayesian cutoffs
futility_critical_value=0.3
efficacy_critical_value=0.1
toxicity_critical_value=0.1
no_toxicity_critical_value=0.3

byrant_day_optimal=properties(out,t,r,pra,prb,pta,ptb,
                              futility_critical_value,efficacy_critical_value,
                              toxicity_critical_value,no_toxicity_critical_value,
                              target="optimal")

byrant_day_minmax=properties(out,t,r,pra,prb,pta,ptb,
                             futility_critical_value,efficacy_critical_value,
                             toxicity_critical_value,no_toxicity_critical_value,
                             target="minmax")

bayes_table=list(byrant_day_optimal=byrant_day_optimal,
                 byrant_day_minmax=byrant_day_minmax)
class(bayes_table)=c("list_trialDesign_binom_two",class(bayes_table))

bayes_table



