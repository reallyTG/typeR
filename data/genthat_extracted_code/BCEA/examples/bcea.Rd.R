library(BCEA)


### Name: bcea
### Title: Bayesian Cost-Effectiveness Analysis
### Aliases: bcea bcea.default CEanalysis
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
      Kmax=50000,           # maximum value possible for the willingness 
                            #  to pay threshold; implies that k is chosen 
                            #  in a grid from the interval (0,Kmax)
      plot=TRUE          # plots the results
)
#
# Creates a summary table
summary(m,      # uses the results of the economic evalaution 
                #  (a "bcea" object)
      wtp=25000	# selects the particular value for k 
)

## No test: 
#
# Plots the cost-effectiveness plane using base graphics
ceplane.plot(m,      # plots the Cost-Effectiveness plane
      comparison=1,  # if more than 2 interventions, selects the
                     #  pairwise comparison 
      wtp=25000,     # selects the relevant willingness to pay 
                     #  (default: 25,000) 
      graph="base"   # selects base graphics (default)
)
#
# Plots the cost-effectiveness plane using ggplot2
if(requireNamespace("ggplot2")){
ceplane.plot(m,      # plots the Cost-Effectiveness plane
      comparison=1,  # if more than 2 interventions, selects the
                     #  pairwise comparison 
      wtp=25000,     # selects the relevant willingness to pay 
                     #  (default: 25,000) 
      graph="ggplot2"# selects ggplot2 as the graphical engine
)
#
# Some more options
ceplane.plot(m,
      graph="ggplot2",
      pos="top",
      size=5,
      ICER.size=1.5,
      label.pos=FALSE,
      opt.theme=ggplot2::theme(text=ggplot2::element_text(size=8))
)
}
#
# Plots the contour and scatterplot of the bivariate 
# distribution of (Delta_e,Delta_c)
contour(m,          # uses the results of the economic evalaution 
                    #  (a "bcea" object)
      comparison=1, # if more than 2 interventions, selects the 
                    #  pairwise comparison 
      nlevels=4,    # selects the number of levels to be 
                    #  plotted (default=4)
      levels=NULL,  # specifies the actual levels to be plotted 
                    #  (default=NULL, so that R will decide)
      scale=0.5,    # scales the bandwiths for both x- and 
                    #  y-axis (default=0.5)
      graph="base"  # uses base graphics to produce the plot
)
#
# Plots the contour and scatterplot of the bivariate 
#   distribution of (Delta_e,Delta_c)
contour2(m,       # uses the results of the economic evalaution 
                  #  (a "bcea" object)
      wtp=25000,  # selects the willingness-to-pay threshold
      xl=NULL,    # assumes default values
      yl=NULL     # assumes default values
)
#
# Using ggplot2
if(requireNamespace("ggplot2")){
contour2(m,           # uses the results of the economic evalaution 
                      #  (a "bcea" object)
      graph="ggplot2",# selects the graphical engine
      wtp=25000,      # selects the willingness-to-pay threshold
      xl=NULL,        # assumes default values
      yl=NULL,        # assumes default values
      label.pos=FALSE # alternative position for the wtp label
)
}
#
# Plots the Expected Incremental Benefit for the "bcea" object m
eib.plot(m)
#
# Plots the distribution of the Incremental Benefit
ib.plot(m,        # uses the results of the economic evalaution 
                  #  (a "bcea" object)
    comparison=1, # if more than 2 interventions, selects the 
                  #  pairwise comparison 
    wtp=25000,    # selects the relevant willingness 
                  #  to pay (default: 25,000)
    graph="base"  # uses base graphics
)
#
# Produces a plot of the CEAC against a grid of values for the 
# willingness to pay threshold
ceac.plot(m)
#
# Plots the Expected Value of Information for the "bcea" object m
evi.plot(m)
#
## End(No test)



