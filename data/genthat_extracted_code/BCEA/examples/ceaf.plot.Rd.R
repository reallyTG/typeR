library(BCEA)


### Name: ceaf.plot
### Title: Cost-Effectiveness Acceptability Frontier (CEAF) plot
### Aliases: ceaf.plot
### Keywords: Health economic evaluation Multiple comparison

### ** Examples

# See Baio G., Dawid A.P. (2011) for a detailed description of the 
# Bayesian model and economic problem
#
# Load the processed results of the MCMC simulation model
data(Vaccine)
# 
# Runs the health economic evaluation using BCEA
m <- bcea(e=e,c=c,          # defines the variables of 
                            #  effectiveness and cost
      ref=2,                # selects the 2nd row of (e,c) 
                            #  as containing the reference intervention
      interventions=treats, # defines the labels to be associated 
                            #  with each intervention
      Kmax=50000,           # maximum value possible for the willingness 
                            #  to pay threshold; implies that k is chosen 
                            #  in a grid from the interval (0,Kmax)
      plot=FALSE            # inhibits graphical output
)
#
## No test: 
mce <- multi.ce(m)          # uses the results of the economic analysis 
## End(No test)
#
## No test: 
ceaf.plot(mce)              # plots the CEAF 
## End(No test)
#
## No test: 
ceaf.plot(mce, graph="g")   # uses ggplot2 
## End(No test)

## No test: 
# Use the smoking cessation dataset
data(Smoking)
m <- bcea(e,c,ref=4,intervention=treats,Kmax=500,plot=FALSE)
mce <- multi.ce(m)
ceaf.plot(mce)
## End(No test)



