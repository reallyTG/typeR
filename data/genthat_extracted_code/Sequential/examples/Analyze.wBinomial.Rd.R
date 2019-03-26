library(Sequential)


### Name: Analyze.wBinomial
### Title: Function for group sequential analyses of multiple weighted
###   binomial endpoints, without the need to know group sizes a priori.
### Aliases: Analyze.wBinomial
### Keywords: Binomial sequential analysis

### ** Examples


### Example. Four chunks of data.

### Firstly, it is necessary to set up the input parameters.
##  Note: cut off the "#" symbol before running the two lines below.

#   AnalyzeSetUp.wBinomial(name="Rofe_Naisds",N=1000,alpha=0.05,M=1,
#   rho=0.5,title="rofecoxib (Vioxx) vs. NSAID comparison",
#   address="C:/Users/Ivair/Documents",
#   Tailed=2)

### Now we apply sequential tests to each of two chunks of data.
# -------------------------------------------------------------------------

## This example is based on two outcomes, myocardinal
#  infarction (w1=2.2), and major bleeding (w2=0.04), obtained
#  from a study comparing risk of myocardial infarction and
#  gastrointestinal bleeding. See details in Silva et al (2019).
  
## Test 1
## Note: cut off the "#" symbol before running the line below.
#  Analyze.wBinomial(name="Rofe_Naisds",test=1,z=1,w=c(2.2,0.04),
#  ExposureA=c(11,12),ExposureB=c(13,10),AlphaSpend="n" )

## Test 2
## Note: cut off the "#" symbol before running the line below.
#  Analyze.wBinomial(name="Rofe_Naisds",test=2,z=c(1,1),
#  w=c(2.2,0.04),ExposureA=c(19,12),ExposureB=c(16,11),AlphaSpend="n")



