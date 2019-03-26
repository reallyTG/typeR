library(PowerTOST)


### Name: power.HVNTID
### Title: (Empirical) Power for BE decision via FDA method for highly
###   variable NTIDs
### Aliases: power.HVNTID

### ** Examples

# using the defaults:
# GMR=0.95, theta1=0.8, theta2=1.25, full replicate design 2x2x4, 100 000 sims
# and a CV of 0.3 (=30%) for both Reference and Test, with 24 subjects, balanced
power.HVNTID(CV=0.3, n=24)
# should give a power of 0.86354



