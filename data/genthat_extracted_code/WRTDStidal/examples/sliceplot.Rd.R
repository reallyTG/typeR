library(WRTDStidal)


### Name: sliceplot
### Title: Plot time slices within a tidal object
### Aliases: sliceplot sliceplot.tidal sliceplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

# plot using defaults
sliceplot(tidfit)

# get different months - march and september
sliceplot(tidfit, slices = c(3, 9))

# normalized predictions, 10th percentile
sliceplot(tidfit, tau = 0.1, predicted = FALSE)

# normalized values all months, change line aesthetics, log-space, 90th 
# add title
library(ggplot2)
sliceplot(tidfit, 
 slices = 1:12, 
 size = 1.5, 
 tau = 0.9, 
 alpha = 0.6, 
 predicted = FALSE, 
 logspace = TRUE
) + 
ggtitle('Normalized predictions for all months, 90th percentile')

 ## plot a tidalmean object
 data(tidfitmean)
 
 sliceplot(tidfitmean)



