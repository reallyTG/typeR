library(EValue)


### Name: sens_plot
### Title: Plots for sensitivity analyses
### Aliases: sens_plot
### Keywords: confounding, meta-analysis, sensitivity

### ** Examples

# with variable bias and with confidence band
sens_plot( type="line", q=log(1.1), Bmin=log(1), Bmax=log(4), sigB=0.1,
           yr=log(1.3), vyr=0.005, t2=0.4, vt2=0.03 )

# with fixed bias and without confidence band
sens_plot( type="line", q=log(1.1), Bmin=log(1), Bmax=log(4),
           yr=log(1.3), t2=0.4 )

# apparently preventive
sens_plot( type="line", q=log(0.90), Bmin=log(1), Bmax=log(4),
           yr=log(0.6), vyr=0.005, t2=0.4, vt2=0.04 )

# distribution plot: apparently causative
# commented out because takes 5-10 seconds to run
# sens_plot( type="dist", q=log(1.1), muB=log(2),
#           yr=log(1.3), t2=0.4 )
           
# distribution plot: apparently preventive
# commented out because takes 5-10 seconds to run
# sens_plot( type="dist", q=log(0.90), muB=log(1.5),
#           yr=log(0.7), t2=0.2 )



