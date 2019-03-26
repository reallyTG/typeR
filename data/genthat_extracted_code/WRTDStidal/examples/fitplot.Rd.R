library(WRTDStidal)


### Name: fitplot
### Title: Plot the fitted results for a tidal object
### Aliases: fitplot fitplot.tidal fitplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

# plot using defaults
fitplot(tidfit)

# get the same plot but use default ggplot settings
fitplot(tidfit, pretty = FALSE)

# plot in log space
fitplot(tidfit, logspace = TRUE)

# plot specific quantiles
fitplot(tidfit, tau = c(0.1, 0.9))

# plot the normalized predictions
fitplot(tidfit, predicted = FALSE)

# plot as monthly values
fitplot(tidfit, annuals = FALSE) 

# format the x-axis is using annual aggregations
library(ggplot2)

fitplot(tidfit, annual = TRUE) + 
 scale_x_date(limits = as.Date(c('2000-01-01', '2012-01-01')))

# modify the plot as needed using ggplot scales, etc.

fitplot(tidfit, pretty = FALSE, linetype = 'dashed') + 
 theme_classic() + 
 scale_y_continuous(
   'Chlorophyll', 
   limits = c(0, 50)
   ) +
 scale_colour_manual( 
   'Predictions', 
   labels = c('lo', 'md', 'hi'), 
   values = c('red', 'green', 'blue'), 
   guide = guide_legend(reverse = TRUE)
   ) 
 
# plot a tidalmean object
data(tidfitmean)

fitplot(tidfitmean)  



