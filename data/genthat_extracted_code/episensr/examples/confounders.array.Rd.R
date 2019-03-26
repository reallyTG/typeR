library(episensr)


### Name: confounders.array
### Title: Sensitivity analysis for unmeasured confounders based on
###   confounding imbalance among exposed and unexposed
### Aliases: confounders.array

### ** Examples

# Example from Schneeweiss, S. Sensitivity analysis and external adjustment for
# unmeasured confounders in epidemiologic database studies of therapeutics.
# Pharmacoepidemiol Drug Safety 2006; 15: 291-303.
confounders.array(crude.risk = 1.5, type = "binary",
bias_parms = c(5.5, 0.5, 0.1))
# Examples from Patorno E., Gopalakrishnan, C., Franklin, J.M., Brodovicz, K.G.,
# Masso-Gonzalez, E., Bartels, D.B., Liu, J., and Schneeweiss, S. Claims-based
# studies of oral glucose-lowering medications can achieve balance in critical
# clinical variables only observed in electronic health records 2017; 20(4): 974-
# 984.
confounders.array(crude.risk = 1.5, type = "binary",
bias_parms = c(3.25, 0.333, 0.384))
confounders.array(crude.risk = 1.5, type = "continuous",
bias_parms = c(1.009, 7.8, 7.9))
confounders.array(crude.risk = 0.05, type = "RD", bias_parms = c(0.009, 8.5, 8),
dec = 4)



