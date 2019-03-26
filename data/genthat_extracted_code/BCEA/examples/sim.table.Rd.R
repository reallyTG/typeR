library(BCEA)


### Name: sim.table
### Title: Table of simulations for the health economic model
### Aliases: sim.table
### Keywords: Health economic evaluation

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
      Kmax=50000            # maximum value possible for the willingness 
                            #  to pay threshold; implies that k is chosen 
                            #  in a grid from the interval (0,Kmax)
)
#
# Now can save the simulation exercise in an object using sim.table()
st <- sim.table(m, # uses the results of the economic evalaution 
                   #  (a "bcea" object)
        wtp=25000  # selects the particular value for k
)
#
# The table can be explored. For example, checking the 
#  element 'Table' of the object 'st'



