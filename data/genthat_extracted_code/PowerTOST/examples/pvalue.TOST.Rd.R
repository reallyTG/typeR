library(PowerTOST)


### Name: pvalue.TOST
### Title: p-value(s) of the TOST procedure
### Aliases: pvalue.TOST pvalues.TOST

### ** Examples

# Defaults: 2x2 crossover, log-transformation
# BE acceptance limits 0.8 ... 1.25, usual df's
# interested in both p-values
pvalues.TOST(pe=0.95, CV=0.3, n=12)
# gives the vector (named elements)
#     p.left    p.right
# 0.09105601 0.02250985
# i.e. 'left' hypothesis H01: theta<=theta1 can't be rejected
# 'right' hypothesis H02: theta>=theta2 can be rejected

# max. p-value only as 'overall' pvalue, preferred by Benjamin
pvalue.TOST(pe=0.912, CV=0.333, n=24)
# should give 0.08777621, i.e inequivalence can't be rejected
# this is operationally identical to 
CI.BE(pe=0.912, CV=0.333, n=24)
# lower limit = 0.7766 outside 0.8 ... 1.25, i.e inequivalence can't be rejected



