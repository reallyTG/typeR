library(WRTDStidal)


### Name: seasyrplot
### Title: Plot seasonal model response by years
### Aliases: seasyrplot seasyrplot.tidal seasyrplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

# plot using defaults
seasyrplot(tidfit)

# get the same plot but use default ggplot settings
seasyrplot(tidfit, pretty = FALSE)

# plot specific quantiles
seasyrplot(tidfit, tau = c(0.9))

# plot the normalized predictions
seasyrplot(tidfit, predicted = FALSE)

# modify the plot as needed using ggplot scales, etc.

library(ggplot2)

seasyrplot(tidfit, pretty = FALSE, linetype = 'dashed') + 
 theme_classic() + 
 scale_y_continuous(
   'Chlorophyll', 
   limits = c(0, 5)
   )
   
# plot a tidalmean object
data(tidfitmean)

seasyrplot(tidfitmean)    



