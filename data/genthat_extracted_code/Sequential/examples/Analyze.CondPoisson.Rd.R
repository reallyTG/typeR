library(Sequential)


### Name: Analyze.CondPoisson
### Title: Function to conduct group sequential analyses for conditional
###   Poisson data without the need to know group sizes a priori.
### Aliases: Analyze.CondPoisson
### Keywords: Poisson sequential analysis

### ** Examples


### Example. Four chunks of data.

### Firstly, it is necessary to set up the input parameters.
##  Here we use the Wald type alpha spending.
##  Note: cut off the "#" symbol before running the two lines below, and,
##  Important: choose an actual "address" to save your set up information. 
#   AnalyzeSetUp.CondPoisson(name="TestA", SampleSizeType="Events", K=100,
#   cc=20,alpha=0.05, M=1,AlphaSpendType="power-type",rho=0.5,title="n",
#   address="C:/Users/Ivair/Documents")

### Now we apply a test for each one of three chunks of data.
# -------------------------------------------------------------------------
  
## Test 1 - Situation where the expected number of events is equal to 5.
## The observed hypothetical information is "PersonTimeRatio=0.5".
## Note: cut off the "#" symbol before running the line below.

#  Analyze.CondPoisson(name="TestA",test=1,events=5,PersonTimeRatio=0.5)


## Test 2 - Situation where the expected number of events is equal to 6.
## The observed hypothetical information is "PersonTimeRatio=0.3".

#Analyze.CondPoisson(name="TestA",test=2,events=6,PersonTimeRatio=0.3)


## Test 3 - Situation where the expected number of events is equal to 10.
## The observed hypothetical information is "PersonTimeRatio=0.1".

#Analyze.CondPoisson(name="TestA",test=3,events=10,PersonTimeRatio=0.1)
 



