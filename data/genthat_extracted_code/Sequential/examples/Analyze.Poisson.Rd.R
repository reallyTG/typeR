library(Sequential)


### Name: Analyze.Poisson
### Title: Function to conduct group sequential analyses for Poisson data
###   without the need to know group sizes a priori.
### Aliases: Analyze.Poisson
### Keywords: Poisson sequential analysis

### ** Examples


### Example. Four chunks of data.

### Firstly, it is necessary to set up the input parameters.
##  Here we use the Wald type alpha spending.
##  Note: cut off the "#" symbol before running the two lines below, and,
##  very important, choose an actual "address" to save your set up information. 
#   AnalyzeSetUp.Poisson(name="VaccineA", SampleSize=100, alpha=0.05,
#   M=1,AlphaSpendType="power-type",rho=0.5,title="n",
#   address="C:/Users/Ivair/Documents")

### Now we can sequentially apply a test for each one of three chunks of data.
# -------------------------------------------------------------------------
  
## Test 1 - Situation where the expected number of events under H0 is equal to 2.
## This first test uses the default Wald type alpha spending (AlphaSpend="n").
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Poisson(test=1,mu0=2,events=1,AlphaSpend="n")

## Test 2 - Situation where the expected number of events under H0 is equal to 0.8.
## Observe that here we use an arbitrary alpha spending of 0.02.
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Poisson(test=2,mu0=0.8,events=2, AlphaSpend=0.02)

## Test 3 - Situation of elevated number of events, but now the
## arbitrary alpha spending is of 0.04.
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Poisson(test=3,mu0=9,events=10, AlphaSpend=0.04)
 



