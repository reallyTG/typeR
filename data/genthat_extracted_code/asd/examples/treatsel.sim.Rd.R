library(asd)


### Name: treatsel.sim
### Title: ASD simulation for treatment selection
### Aliases: treatsel.sim
### Keywords: design

### ** Examples


# two test treatment groups
# effect size = 0.3 for group 1
# for both early and final normal outcomes
# correlation = 0.3
# select one treatment only at interim
treatsel.sim(n=list(stage1=100,stage2=300),
        effect=list(early=c(0,0.3,0),final=c(0,0.3,0)),
        outcome=list(early="N",final="N"),
        nsim=100,corr=0.3,seed=145514,select=1,
        level=0.025,ptest=c(1,2),fu=FALSE,
        method="invnorm",file="")

# five test treatment groups
# correlation = 0.3
# flexible selection rule, with epsilon = 1
treatsel.sim(n=list(stage1=100,stage2=300),
        effect=list(early=c(0,0.3,0.2,0.1,0.3,0.05),
        final=c(0,0.2,0.3,0.2,0.1,0.5)),
        outcome=list(early="N",final="N"),
        nsim=200,corr=0.3,seed=145514,select=4,epsilon=1,
        level=0.025,ptest=c(1:5),method="invnorm")




