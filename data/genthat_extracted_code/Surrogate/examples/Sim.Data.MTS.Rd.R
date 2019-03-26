library(Surrogate)


### Name: Sim.Data.MTS
### Title: Simulates a dataset that can be used to assess surrogacy in the
###   multiple-trial setting
### Aliases: Sim.Data.MTS
### Keywords: Simulate data Multiple-trial setting

### ** Examples

# Simulate a dataset with 2000 patients, 50 trials, Rindiv=Rtrial=.8, D.aa=10,
# D.bb=50, and fixed effect values 1, 2, 30, and 90:
Sim.Data.MTS(N.Total=2000, N.Trial=50, R.Trial.Target=.8, R.Indiv.Target=.8, D.aa=10, 
D.bb=50, Fixed.Effects=c(1, 2, 30, 90), Seed=1)  

# Sample output, the first 10 rows of Data.Observed.MTS:
Data.Observed.MTS[1:10,]

# Note: When the following code is used to generate a dataset:
Sim.Data.MTS(N.Total=2000, N.Trial=99, R.Trial.Target=.5, R.Indiv.Target=.8, 
D.aa=10, D.bb=50, Fixed.Effects=c(1, 2, 30, 90), Seed=1)  

# R gives the following warning: 

# > NOTE: The number of patients per trial requested in the function call 
# > equals 20.20202 (=N.Total/N.Trial), which is not a whole number.  
# > To obtain a dataset where the number of patients per trial is balanced for 
# > all trials, the number of patients per trial was rounded to 21 to generate 
# > the dataset. Data.Observed.MTS thus contains a total of 2079 patients rather 
# > than the requested 2000 in the function call.



