library(EurosarcBayes)


### Name: freq_binom_two_singlestage
### Title: Frequentist single-arm two-endpoint trial sample size
### Aliases: freq_binom_two_singlestage

### ** Examples

r1=0.35
r0=0.2
t0=0.3
t1=0.1

power=0.8
alpha=0.1

nmax=50
out_single=freq_binom_two_singlestage(r0,r1,t0,t1,power,alpha,nmax,adjust=TRUE)

########################################
# Information for properties
## Frequentist simulations
# modelled toxicity probability
t=c(0.1,0.3,0.1,0.3)
# modelled response probability
r=c(0.35,0.2,0.2,0.35)

## Bayesian uniform prior
pra=1;prb=1;pta=1;ptb=1
## bayesian cutoffs
futility_critical_value=0.35
efficacy_critical_value=0.2
toxicity_critical_value=0.1
no_toxicity_critical_value=0.3

single_stage=properties(out_single,t,r,pra,prb,pta,ptb,futility_critical_value,
	efficacy_critical_value,toxicity_critical_value,no_toxicity_critical_value)

single_stage



