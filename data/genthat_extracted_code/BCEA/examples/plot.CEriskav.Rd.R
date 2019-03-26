library(BCEA)


### Name: plot.CEriskav
### Title: Summary plot of the health economic analysis when risk aversion
###   is included
### Aliases: plot.CEriskav
### Keywords: Health economic evaluation Risk aversion

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
# Define the vector of values for the risk aversion parameter, r, eg:
r <- c(0.000000000001,0.005,0.020,0.035) 
#
# Run the cost-effectiveness analysis accounting for risk aversion
## No test: 
cr <- CEriskav(m,     # uses the results of the economic evalaution 
                      #  (a "bcea" object)
        r=r,          # defines the vector of values for the risk 
                      #  aversion parameter
        comparison=1  # if more than 2 interventions, selects the 
                      #  pairwise comparison 
)
## End(No test)
#
# Now produce the plots
## No test: 
plot(cr # uses the results of the risk aversion 
        #  analysis (a "CEriskav" object)
)
## End(No test)
### Alternative options, using ggplot2
## No test: 
plot(cr,
  graph="ggplot2",
  plot="ask"          # plot option can be specified as
                      #  "dev.new" (default), "x11" or "ask"
  )
## End(No test)



