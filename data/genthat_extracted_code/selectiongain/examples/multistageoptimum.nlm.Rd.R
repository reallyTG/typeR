library(selectiongain)


### Name: multistageoptimum.nlm
### Title: Function for optimizing n-stage selection with the NLM algorithm
###   for a given correlation matrix
### Aliases: multistageoptimum.nlm
### Keywords: Optimization

### ** Examples


 VCGCAandError=c(0.40,0.20,0.20,0.40,2.00)
 VCSCA=c(0.20,0.10,0.10,0.20)

corr = multistagecor (maseff=0.40,
  VGCAandE=VCGCAandError,  VSCA=VCSCA, T=c(1,1,5),
  L=c(1,3,8), Rep=c(1,1,1))

# the time of nlm have to be controled in 5 s, so this example will not be uploaded into cran

#multistageoptimum.nlm( corr=corr, Vg=0.4,
#Budget=1021, CostProd=c(0.5,0,0),CostTest=c(0.5,6,40), Nf=10,
# N.upper=c(600,120,20), N.lower=rep(5,3))





