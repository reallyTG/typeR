library(divDyn)


### Name: survivors
### Title: Proportions of survivorship
### Aliases: survivors

### ** Examples

data(corals)
surv<-survivors(corals, tax="genus", bin="stg", method="forward")

# plot
data(stages)
tsplot(stages, shading="series", boxes="sys", xlim=c(260,0), 
  ylab="proportion of survivors present", ylim=c(0.01,1),plot.args=list(log="y"))
  
for(i in 1:ncol(surv)) lines(stages$mid, surv[,i])




