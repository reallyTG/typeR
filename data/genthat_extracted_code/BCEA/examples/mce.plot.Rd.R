library(BCEA)


### Name: mce.plot
### Title: Plots the probability that each intervention is the most
###   cost-effective
### Aliases: mce.plot
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
mce <- multi.ce(m)          # uses the results of the economic analysis 
#
mce.plot(mce,               # plots the probability of being most cost-effective
      graph="base")         #  using base graphics
#
if(require(ggplot2)){
mce.plot(mce,               # the same plot
      graph="ggplot2")      #  using ggplot2 instead
}



