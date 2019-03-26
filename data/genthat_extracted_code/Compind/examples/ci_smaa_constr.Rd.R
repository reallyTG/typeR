library(Compind)


### Name: ci_smaa_constr
### Title: Constrained stochastic multi-objective acceptability analysis
###   (C-SMAA)
### Aliases: ci_smaa_constr

### ** Examples

data(EU_NUTS1)

# Standard SMAA 
test <- ci_smaa_constr(EU_NUTS1,c(2,3), rep=200, label = EU_NUTS1[,1])
source("http://www.phaget4.org/R/myImagePlot.R") 
myImagePlot(test$ci_smaa_constr_rank_freq)
test$ci_smaa_constr_average_rank

# Constrained SMAA 
test2 <- ci_smaa_constr(EU_NUTS1,c(2,3), rep=200, label = EU_NUTS1[,1], low_w=c(0.2,0.2) )
myImagePlot(test2$ci_smaa_constr_rank_freq)
test2$ci_smaa_constr_average_rank




