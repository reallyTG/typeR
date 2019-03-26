library(distdichoR)


### Name: distdichoi
### Title: nomal data (immdediate form, allowing unequal variances)
### Aliases: distdichoi

### ** Examples

# Immediate form of distdicho
distdichoi(n1 = 494, m1 = 3267.4, s1 = 441.3,
           n2 = 983, m2 = 3452, s2 = 435.9,
           cp = 2500, tail = 'upper')

## Proportions of low birth weight babies among smoking and non-smoking mothers
## (data from Peacock et al. 1995). Returns distributional estimates, standard 
## errors and distributional confidence intervals for differences in proportions,
## RR and OR of babies having a birth weight under 2500g (low birth weight LBW)
## for group smoker (mother smokes) over the odds of LBW in group non-smoker 
## (mother doesn't smoke)
# distdicho and distdichoi are returning the same results
bw_smoker <- bwsmoke$birthwt[bwsmoke$smoke == 'smoker']
bw_nonsmoker <- bwsmoke$birthwt[bwsmoke$smoke == 'non-smoker']
distdicho(x = bw_smoker, y = bw_nonsmoker, cp = 2500)
distdichoi(n1 = length(bw_smoker[!is.na(bw_smoker)]), 
           m1 = mean(bw_smoker, na.rm = TRUE), 
           s1 = sd(bw_smoker, na.rm = TRUE),
           n2 = length(bw_nonsmoker[!is.na(bw_smoker)]), 
           m2 = mean(bw_nonsmoker, na.rm = TRUE), 
           s2 = sd(bw_nonsmoker, na.rm = TRUE), 
           cp = 2500)




