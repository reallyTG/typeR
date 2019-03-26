library(confreq)


### Name: lr
### Title: Likelihood Ratio Chi-square (LR)
### Aliases: lr

### ** Examples

#######################################
######### some examples ########
data(newborns)
newborns
designmatrix <- design_cfg_cfa(kat=c(2,2)) # generate an designmatrix (only main effects)
observed <- newborns[,3] # extract observed counts
expected <- expected_cfa(des=designmatrix, observed=observed) # calculation of expected counts
lr(observed,expected) # calculation of the likelihood ratio chi-square statistic




