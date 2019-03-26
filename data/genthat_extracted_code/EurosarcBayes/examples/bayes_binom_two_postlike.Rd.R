library(EurosarcBayes)


### Name: bayes_binom_two_postlike
### Title: Bayesian, single arm, two endpoint trial designs.
### Aliases: bayes_binom_two_postlike

### ** Examples

# modelled toxicity probability
t=c(0.1,0.1,0.3,0.3)
# modelled response probability
r=c(0.35,0.2,0.2,0.35)

reviews=c(10,15,20,25,30,35,40)

# uniform prior
pra=1;prb=1;pta=1;ptb=1

# End of trial stopping rules for success
efficacy_critical_value=0.2
efficacy_prob_stop=0.9
toxicity_critical_value=0.2
toxicity_prob_stop=0.8

# interim required probability to stop
int_combined_prob=0.99
int_futility_prob=1
int_toxicity_prob=1
int_efficacy_prob=0.99

# unused in the design for comparison to previous design
futility_critical_value=0.35
no_toxicity_critical_value=0.3

s=bayes_binom_two_postlike(t,r,reviews,pra,prb,pta,ptb,
efficacy_critical_value,efficacy_prob_stop,toxicity_critical_value,
toxicity_prob_stop,int_combined_prob,int_futility_prob,
int_toxicity_prob,int_efficacy_prob,futility_critical_value,
no_toxicity_critical_value)

s

plot(s)



