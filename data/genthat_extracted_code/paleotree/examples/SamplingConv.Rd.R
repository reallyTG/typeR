library(paleotree)


### Name: SamplingConv
### Title: Converting Sampling Estimates
### Aliases: SamplingConv sProb2sRate sRate2sProb pqsRate2sProb qsProb2Comp
###   qsRate2Comp sRate2sProb pqsRate2sProb qsProb2Comp qsRate2Comp

### ** Examples


sRate2sProb(r = 0.5)
sProb2sRate(R = 0.1)
pqsRate2sProb(r = 0.5,p = 0.1,q = 0.1)

# different modes can be tried
qsProb2Comp(R = 0.1,q = 0.1,mode = "budding")
qsProb2Comp(R = 0.1,q = 0.1,mode = "bifurcating")

qsRate2Comp(r = 0.1,q = 0.1)



