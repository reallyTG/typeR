library(EurosarcBayes)


### Name: bayes_binom_two_postprob
### Title: Bayesian, single arm, two endpoint trial design, using posterior
###   probability to make decisions.
### Aliases: bayes_binom_two_postprob

### ** Examples

# modelled toxicity probability
t=c(0.1,0.1,0.3,0.3)
# modelled response probability
r=c(0.35,0.2,0.2,0.35)

reviews=c(10,15,20,25,30,35,40)

# uniform prior
pra=1;prb=1;pta=1;ptb=1

futility_critical_value=0.35
futility_prob_stop=c(0.95,0.95,0.95,0.95,0.95,0.95,0)

efficacy_critical_value=0.2
efficacy_prob_stop=c(1,1,0.95,0.95,0.95,0.95,0.9)

toxicity_critical_value=0.1
toxicity_prob_stop=c(0.95,0.95,0.95,0.95,0.95,0.95,0.95)

no_toxicity_critical_value=0.3
toxicity_prob_stop=c(0.95,0.95,0.95,0.95,0.95,0.95,0.95)

s=bayes_binom_two_postprob(t,r,reviews,pra,prb,pta,ptb,
futility_critical_value,futility_prob_stop,efficacy_critical_value,
efficacy_prob_stop,toxicity_critical_value,toxicity_prob_stop,
no_toxicity_critical_value,toxicity_prob_stop)

s

plot(s)



