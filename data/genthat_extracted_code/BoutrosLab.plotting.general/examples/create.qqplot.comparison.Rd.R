library(BoutrosLab.plotting.general)


### Name: create.qqplot.comparison
### Title: Make a quantile-quantile plot of two samples
### Aliases: create.qqplot.comparison
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D create.qqplot.comparison(
##D     filename = paste0(tempdir(),'/QQcomparison_Simple.tiff'),
##D     x = list(rnorm(100), rnorm(100))
##D     );
##D 
##D # Minimal Input
##D create.qqplot.comparison(
##D     filename = paste0(tempdir(),'/QQcomparison_Minimal_Input.tiff'),
##D     x = list(microarray[1:500,2], microarray[1:500,2]),
##D     main = 'Minimal input',
##D     description = 'QQplot comparison created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.qqplot.comparison(
##D     filename = paste0(tempdir(),'/QQcomparison_Axes_Labels.tiff'),
##D     x = list(microarray[1:500,2], microarray[1:500,2]),
##D     main = 'Axes & labels',
##D     # adding axes and labels
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # adding grid for good measure
##D     add.grid = TRUE,
##D     description = 'QQplot comparison created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Formula input
##D 
##D # 'Formula' format of data
##D chr.locations <- microarray$Chr[1:500];
##D chr.locations <- replace(chr.locations, which(chr.locations == 1), 'Chromosome 1');
##D chr.locations <- replace(chr.locations, which(chr.locations == 2), 'Chromosome 2');
##D 
##D qqplot.data <- data.frame(
##D     sample = c(rep('Sample 1', 500), rep('Sample 2', 500)),
##D     value = c(microarray[1:500,1], microarray[1:500,2]),
##D     chr = chr.locations
##D     );
##D 
##D 
##D create.qqplot.comparison(
##D     filename = paste0(tempdir(),'/QQcomparison_Formula.tiff'),
##D     # Using a different input method
##D     x = sample ~ value,
##D     data = qqplot.data,
##D     main = 'Formula input',
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xaxis.lab = seq(0, 15, 5),
##D     yaxis.lab = seq(0, 15, 5),
##D     xlimits = c(0, 17),
##D     ylimits = c(0, 17),
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     add.grid = TRUE,
##D     description = 'QQplot comparison created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Groups & Legend
##D create.qqplot.comparison(
##D  filename = paste0(tempdir(),'/QQcomparison_Groups_Legend.tiff'),
##D     x = sample ~ value,
##D     data = qqplot.data,
##D     # Using fake grouping for the sake of illustration
##D     groups = qqplot.data$chr,
##D     # Set colours to differente the gruops
##D     col = default.colours(3),
##D     # Setting different plotting characters
##D     pch = c(15, 16),
##D     main = 'Groups & legend',
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     add.grid = TRUE,
##D     # Adding legend to explain groups
##D     key = list(
##D         text = list(
##D             lab = c('1','2'),
##D             cex = 1.5,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = c(15, 16),
##D             col = default.colours(2),
##D             cex = 1
##D             ),
##D         x = 0.04,
##D         y = 0.95,
##D         padding.text = 2
##D         ),
##D     description = 'QQplot comparison created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Multiple qq plots
##D create.qqplot.comparison(
##D     filename = paste0(tempdir(),'/QQcomparison_Multiple.tiff'),
##D     x = sample ~ value | chr,
##D     data = qqplot.data,
##D     main = 'Multiple plots',
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     add.grid = TRUE,
##D     description = 'QQplot comparison created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.qqplot.comparison(
##D     filename = paste0(tempdir(),'/QQcomparison_Nature_style.tiff'),
##D     x = sample ~ value,
##D     data = qqplot.data,
##D     main = 'Nature style',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     add.grid = TRUE,
##D 
##D    # set style to Nature 
##D     style = 'Nature',
##D     
##D     # demonstrating how to italicize character variables
##D     ylab.label = expression(paste('italicized ', italic('a'))),
##D   
##D     # demonstrating how to create en-dashes
##D     xlab.label = expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3)),
##D 
##D     description = 'QQplot comparison created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



