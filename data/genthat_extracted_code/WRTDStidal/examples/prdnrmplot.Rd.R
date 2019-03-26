library(WRTDStidal)


### Name: prdnrmplot
### Title: Plot combined predicted and normalized results from a tidal
###   object
### Aliases: prdnrmplot prdnrmplot.tidal prdnrmplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

## plot using defaults
prdnrmplot(tidfit)

## get the same plot but use default ggplot settings
prdnrmplot(tidfit, pretty = FALSE)

## plot in log space
prdnrmplot(tidfit, logspace = TRUE)

## plot specific quantiles
prdnrmplot(tidfit, tau = c(0.1, 0.9))

## plot the normalized predictions
prdnrmplot(tidfit, predicted = FALSE)

## plot as monthly values
prdnrmplot(tidfit, annuals = FALSE) 

## format the x-axis is using annual aggregations
library(ggplot2)

prdnrmplot(tidfit, annual = TRUE) + 
 scale_x_date(limits = as.Date(c('2000-01-01', '2012-01-01')))

## modify the plot as needed using ggplot scales, etc.
prdnrmplot(tidfit, pretty = FALSE, linetype = 'dashed') + 
 theme_classic() + 
 scale_y_continuous(
   'Chlorophyll', 
   limits = c(0, 50)
   ) +
 scale_colour_manual( 
   '', 
   labels = c('lo', 'md', 'hi'), 
   values = c('red', 'green', 'blue'), 
   guide = guide_legend(reverse = TRUE)
   ) 
 
 ## plot a tidalmean object
 data(tidfitmean)
 
 prdnrmplot(tidfitmean)
 



