library(Power2Stage)


### Name: sampleN2.TOST
### Title: Sample size re-estimation of adaptive 2-stage BE studies in 2x2
###   crossover and parallel designs based on power of TOST
### Aliases: sampleN2.TOST

### ** Examples

# using all the defaults, CV of 25% and 12 subjects in stage 1
print(sampleN2.TOST(CV=0.25, n1=12), row.names=FALSE)
# should give a stage 2 sample of 22 and achieved power ~0.814
# CV 10% and 12 subjects in stage 1
print(sampleN2.TOST(CV=0.1, n1=12), row.names=FALSE)
# should give a sample size of 0 (second stage not reasonable
# since power ~0.973 already achieved in stage 1



