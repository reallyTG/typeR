library(WRTDStidal)


### Name: fitmoplot
### Title: Plot the fitted results for a tidal object by month
### Aliases: fitmoplot fitmoplot.tidal fitmoplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

# plot using defaults
fitmoplot(tidfit)
## Not run: 
##D  
##D # get the same plot but use default ggplot settings
##D fitmoplot(tidfit, pretty = FALSE)
##D 
##D # plot specific quantiles
##D fitmoplot(tidfit, tau = c(0.1, 0.9))
##D 
##D # plot the normalized predictions
##D fitmoplot(tidfit, predicted = FALSE)
##D 
##D # modify the plot as needed using ggplot scales, etc.
##D 
##D library(ggplot2)
##D 
##D fitmoplot(tidfit, pretty = FALSE, linetype = 'dashed') + 
##D  theme_classic() + 
##D  scale_y_continuous(
##D    'Chlorophyll', 
##D    limits = c(0, 5)
##D    ) +
##D  scale_colour_manual( 
##D    'Predictions', 
##D    labels = c('lo', 'md', 'hi'), 
##D    values = c('red', 'green', 'blue'), 
##D    guide = guide_legend(reverse = TRUE)
##D    ) 
##D    
##D # plot a tidalmean object
##D data(tidfitmean)
##D 
##D fitmoplot(tidfitmean)    
## End(Not run)



