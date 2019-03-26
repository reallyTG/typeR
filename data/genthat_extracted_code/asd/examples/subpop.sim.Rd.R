library(asd)


### Name: subpop.sim
### Title: ASD simulation for subpopulation selection
### Aliases: subpop.sim
### Keywords: design

### ** Examples



# hazard ratio in subgroup = 0.6 and full population = 0.9
# for both early and final time-to-event outcomes
# subgroup prevalence = 0.3 and correlation = 0.5
# futility stopping rule, with limits 0 and 0
subpop.sim(n=list(stage1=100,enrich=200,stage2=300),
           effect=list(early=c(0.6,0.9),final=c(0.6,0.9)),
           sprev=0.3,outcome=list(early="T",final="T"),nsim=100,
           corr=0.5,seed=1234,select="futility",weight=NULL,
           selim=c(0,0),level=0.025,method="CT-SD",file="")




