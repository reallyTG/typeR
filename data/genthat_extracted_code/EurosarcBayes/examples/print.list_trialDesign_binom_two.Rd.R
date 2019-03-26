library(EurosarcBayes)


### Name: print.list_trialDesign_binom_two
### Title: Bayesian, single arm, two endpoint trial design, using posterior
###   probability to make decisions.
### Aliases: print.list_trialDesign_binom_two list_trialDesign_binom_two

### ** Examples

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

###############################################################
# Frequentist methods
###############################################################
# Single stage

r1=0.35
r0=0.2
t0=0.3
t1=0.1

power=0.8
alpha=0.1

nmax=50
out_single=freq_binom_two_singlestage(r0,r1,t0,t1,power,alpha,nmax,
	adjust=TRUE)

single_stage=properties(out_single,t,r,pra,prb,pta,ptb,
	futility_critical_value,efficacy_critical_value,
	toxicity_critical_value,no_toxicity_critical_value)

print(single_stage)

###############################################################
# Bayesian posterior probability approach


# analysis at
reviews=c(44)
# Stopping rules at each analysis
futility_prob_stop=0.9
efficacy_prob_stop=0.9
toxicity_prob_stop=0.9
no_toxicity_prob_stop=0.9

bayes_prob_single=bayes_binom_two_postprob(t,r,reviews,pra,prb,pta,
	ptb,futility_critical_value,futility_prob_stop,
	efficacy_critical_value,efficacy_prob_stop,
	toxicity_critical_value,toxicity_prob_stop,
	no_toxicity_critical_value,no_toxicity_prob_stop)

bayes_prob_single


# analysis at
reviews=c(10,17,24,30,37,44)
# Stopping rules at each analysis
futility_prob_stop=c(0.95,0.95,0.95,0.95,0.95,0.9)
efficacy_prob_stop=c(1,1,0.95,0.95,0.95,0.9)
toxicity_prob_stop=c(0.95,0.95,0.95,0.95,0.95,0.9)
no_toxicity_prob_stop=c(1,1,0.95,0.95,0.95,0.9)

bayes_prob_six=bayes_binom_two_postprob(t,r,reviews,pra,prb,pta,
	ptb,futility_critical_value,futility_prob_stop,
	efficacy_critical_value,efficacy_prob_stop,
	toxicity_critical_value,toxicity_prob_stop,
	no_toxicity_critical_value,no_toxicity_prob_stop)

plot(bayes_prob_six)


###############################################################
# Bayesian posterior likelihood approach
###############################################################
reviews=c(11,17,24,30,37,44)

efficacy_prob_stop=0.9
toxicity_prob_stop=0.9

# interim required probability to stop
int_combined_prob=0.95
int_futility_prob=1
int_toxicity_prob=1
int_efficacy_prob=0.95

bayes_like_six=bayes_binom_two_postlike(t,r,reviews,pra,prb,pta,
	ptb,efficacy_critical_value,efficacy_prob_stop,
	toxicity_critical_value,toxicity_prob_stop,int_combined_prob,
	int_futility_prob,int_toxicity_prob,int_efficacy_prob,
	futility_critical_value,no_toxicity_critical_value)

plot(bayes_like_six)

###############################################################
## Table of all designs
###############################################################
tble=list(single_stage=single_stage,bayes_prob_single=bayes_prob_single,
	bayes_prob_six=bayes_prob_six,bayes_like_six=bayes_like_six)

class(tble)=c("list_trialDesign_binom_two",class(tble))
tble
###############################################################



