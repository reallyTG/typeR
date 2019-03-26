library(PowerTOST)


### Name: power.TOST
### Title: Power of the classical TOST procedure
### Aliases: power.TOST

### ** Examples

# power for the 2x2 cross-over design with 24 subjects and CV 25%
# using all the other default values
power.TOST(CV=0.25, n=24)
# should give: [1] 0.7391155
# nct approximation very good for this configuration
power.TOST(CV=0.25, n=24, method="nct")
# gives also: [1] 0.7391155
# shifted-central-t  approximation 
power.TOST(CV=0.25, n=24, method="shifted")
# gives:      [1] 0.7328894

# power for the 2x2 cross-over study with 24 subjects, CV 25%
# and 2 drop-outs in the same sequence group (unbalanced study)
power.TOST(CV=0.25, n=c(10,12))
# should give: [1] 0.6912935
# not the same compared to the balanced setting
power.TOST(CV=0.25, n=22)
# should give: [1] 0.6953401



