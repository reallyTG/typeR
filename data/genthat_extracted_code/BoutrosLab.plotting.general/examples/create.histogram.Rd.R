library(BoutrosLab.plotting.general)


### Name: create.histogram
### Title: Make a histogram
### Aliases: create.histogram
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Simple.tiff'),
##D     x = rnorm(5000),
##D     main = 'Simple',
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
##D 
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Simple_Count.tiff'),
##D     x = rnorm(5000),
##D     main = 'Simple Count',
##D     description = 'Histogram created by BoutrosLab.plotting.general',
##D     type = 'count'
##D     );
##D 
##D # Minimal Input
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Minimal_Input.tiff'),
##D     x = microarray[,1],
##D     main = 'Minimal input',
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Formula Input - dividing by chromosome
##D chr.data <- data.frame(
##D     x = microarray$Chr,
##D     y = microarray[,1]
##D     );
##D 
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Formula_Input.tiff'),
##D     x = y ~ x,
##D     data = chr.data,
##D     main = 'Formula input',
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes and Labels
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Axes_Labels.tiff'),
##D     x = microarray[,1],
##D     main = 'Axes & labels',
##D     # Customizing the axes and labels
##D     xlab.label = 'Bins',
##D     ylab.label = 'Counts',
##D     xlimits = c(0, 16),
##D     xat = seq(0,15,5),
##D     # set break points for bins
##D     breaks = seq(floor(min(microarray[,1])), ceiling(max(microarray[,1])), 1),
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour change
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Colours.tiff'),
##D     x = microarray[,1],
##D     main = 'Colours',
##D     xlab.label = 'Bins',
##D     ylab.label = 'Counts',
##D     xlimits = c(0, 16),
##D     xat = seq(0,15,5),
##D     breaks = seq(floor(min(microarray[,1])), ceiling(max(microarray[,1])), 1),
##D     # Colours
##D     col = 'lightgrey',
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Line type
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Line_Type.tiff'),
##D     x = microarray[,1],
##D     main = 'Line type',
##D     xlab.label = 'Bins',
##D     ylab.label = 'Counts',
##D     xlimits = c(0, 16),
##D     xat = seq(0,15,5),
##D     breaks = seq(floor(min(microarray[,1])), ceiling(max(microarray[,1])), 1),
##D     col = 'lightgrey',
##D     # Changing the line type
##D     lty = 2,
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.histogram(
##D     filename = paste0(tempdir(),'/Histogram_Nature_style.tiff'),
##D     x = microarray[,1],
##D     main = 'Nature style',
##D     xlimits = c(0, 16),
##D     xat = seq(0,15,5),
##D     breaks = seq(floor(min(microarray[,1])), ceiling(max(microarray[,1])), 1),
##D     col = 'lightgrey',
##D 
##D     # set style to Nature 
##D     style = 'Nature',
##D     
##D     # demonstrating how to italicize character variables
##D     ylab.label = expression(paste('italicized ', italic('a'))),
##D   
##D     # demonstrating how to create en-dashes
##D     xlab.label = expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3)),
##D 
##D     description = 'Histogram created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



