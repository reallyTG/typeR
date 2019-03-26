library(Sequential)


### Name: Analyze.Binomial
### Title: Function for group sequential analyses for binomial data,
###   without the need to know group sizes a priori.
### Aliases: Analyze.Binomial
### Keywords: Binomial sequential analysis

### ** Examples


### Example. Four chunks of data.

### Firstly, it is necessary to set up the input parameters.
##  Here we use the Wald type alpha spending.
##  Note: cut off the "#" symbol before running the two lines below.
#     AnalyzeSetUp.Binomial(name="VaccineA",N=200,alpha=0.05,zp=1,M=3,
#     AlphaSpendType="Wald", title="Monitoring_vaccineA",
#     address="C:/Users/Ivair/Documents")

### Now we apply sequential tests to each of four chunks of data.
# -------------------------------------------------------------------------
  
## Test 1 - Situation where each individual event came from a different
## matching ratio.
## This first test uses the default Wald type alpha spending (AlphaSpend="n").
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Binomial(name= "VaccineA",test=1,z=c(1.1,1.3,1.2,1),
#  cases= c(1,0,0,0), controls= c(0,1,1,1) )

## Test 2 - Situation where some of the events came from the same matching
## ratio.
## Observe that here we use an arbitrary alpha spending of 0.02.
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Binomial(name= "VaccineA",test=2,z=c(1,1.5),cases= c(12,1),
#  controls= c(0,10), AlphaSpend=0.02)

## Test 3 - Situation of elevated number of events, but now the
## arbitrary alpha spending is of 0.04, and p is entered instead of z.
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Binomial(name= "VaccineA",test=3,p=c(0.4,0.5),cases= c(12,10),
#  controls= c(10,14), AlphaSpend=0.04)
 
## Test 4 - Situation where all the events came from the same matching
## ratio.
## Here the original target alpha spending is used.
## Note: cut off the "#" symbol before running the line below.
#  Analyze.Binomial(name= "VaccineA",test=4,z=2,cases= 20,controls= 10)



