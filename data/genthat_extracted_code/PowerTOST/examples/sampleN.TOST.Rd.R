library(PowerTOST)


### Name: sampleN.TOST
### Title: Sample size based on power of TOST
### Aliases: sampleN.TOST

### ** Examples

# Exact calculation for a classical 2x2 cross-over (TR/RT),
# BE limits 80 ... 125%, assumed true BE ratio 0.95, intra-subject CV=30%,
# using all the default values
# should give n=40 power=0.815845
sampleN.TOST(CV=0.3)

# Exact calculation for a parallel group design
# evaluation on the original (untransformed) scale
# BE limits 80 ... 120% = -20% ... +20% of reference,
# assumed true BE ratio 0.95% = -5% to reference mean,
# total CV=20%
# should give n=48 (total) power=0.815435
sampleN.TOST(logscale=FALSE, theta1=-0.2, theta0=-0.05, CV=0.2, design="parallel")

# A rather strange setting of theta0! Have a look at n.
# It would be better this is not the sample size but the running total
# of my bank account. But the first million is the hardest ;-).
sampleN.TOST(CV=0.2, theta0=0.8005, theta1=0.8)



