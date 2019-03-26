library(EurosarcBayes)


### Name: bayes_binom_two_loss
### Title: Bayesian, single arm, two endpoint trial designs, using loss
###   functions to make decisions
### Aliases: bayes_binom_two_loss

### ** Examples

# modelled toxicity probability
t=c(0.1,0.1,0.3,0.3)
# modelled response probability
r=c(0.35,0.2,0.2,0.35)

reviews=c(10,15,20,25,30,35,40)
stage_after_trial=40

# uniform prior
pra=1;prb=1;pta=1;ptb=1

efficacy_critical_value=0.2
futility_critical_value=0.35
toxicity_critical_value=0.1
no_toxicity_critical_value=0.3

# alpha/beta ratio
l_alpha_beta=3
# cost of continuing compared to cost of alpha
l_alpha_c=750

efficacy_region_min=0.2
toxicity_region_max=0.3

########################################
# square region
s=bayes_binom_two_loss(t,r,reviews,pra,prb,pta,ptb,l_alpha_beta,
l_alpha_c,stage_after_trial,fun.integrate=tradeoff_square_integrate,
fun.graph=tradeoff_square_graph,efficacy_critical_value,
toxicity_critical_value,futility_critical_value,
no_toxicity_critical_value,efficacy_region_min=efficacy_region_min,
toxicity_region_max=toxicity_region_max)

plot(s)


########################################
# ellipse region
efficacy_region_min=0.2
efficacy_region_max=0.35
toxicity_region_min=0.1
toxicity_region_max=0.3


s=bayes_binom_two_loss(t,r,reviews,pra,prb,pta,ptb,l_alpha_beta,
l_alpha_c,stage_after_trial,fun.integrate=tradeoff_ellipse_integrate,
fun.graph=tradeoff_ellipse_graph,efficacy_critical_value,
toxicity_critical_value,futility_critical_value,
no_toxicity_critical_value,efficacy_region_min=efficacy_region_min,
toxicity_region_max=toxicity_region_max,
efficacy_region_max=efficacy_region_max,
toxicity_region_min=toxicity_region_min)


plot(s)




