library(BCEA)


### Name: mixedAn
### Title: Cost-effectiveness analysis when multiple (possibly non
###   cost-effective) interventions are present on the market
### Aliases: mixedAn mixedAn.default
### Keywords: Health economic evaluation Mixed analysis

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
ma <- mixedAn(m,        # uses the results of the mixed strategy 
                        #  analysis (a "mixedAn" object)
      mkt.shares=NULL,  # the vector of market shares can be defined 
                        #  externally. If NULL, then each of the T 
                        #  interventions will have 1/T market share
      plot=TRUE         # produces the plots
)



