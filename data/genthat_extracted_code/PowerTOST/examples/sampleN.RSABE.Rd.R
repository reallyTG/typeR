library(PowerTOST)


### Name: sampleN.RSABE
### Title: Sample size estimation for BE decision via linearized scaled ABE
###   criterion
### Aliases: sampleN.RSABE

### ** Examples

# using all the defaults:
# design=2x3x3 (partial replicate design), theta0=0.90, 
# ABE limits, PE constraint 0.8 - 1.25
# targetpower=80%, alpha=0.05, 1E5 sims
sampleN.RSABE(CV=0.3)
# should result in a sample size n=45, power=0.80344



