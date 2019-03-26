library(BCEA)


### Name: plot.bcea
### Title: Summary plot of the health economic analysis
### Aliases: plot.bcea
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
      plot=FALSE            # does not produce graphical outputs
)
#
# Plots the summary plots for the "bcea" object m using base graphics
plot(m,graph="base")

# Plots the same summary plots using ggplot2
if(require(ggplot2)){
plot(m,graph="ggplot2")

##### Example of a customized plot.bcea with ggplot2
plot(m,
  graph="ggplot2",                                      # use ggplot2
  theme=theme(plot.title=element_text(size=rel(1.25))), # theme elements must have a name
  ICER.size=1.5,                                        # hidden option in ceplane.plot
  size=rel(2.5)                                         # modifies the size of k= labels
)                                                       #  in ceplane.plot and eib.plot
}



