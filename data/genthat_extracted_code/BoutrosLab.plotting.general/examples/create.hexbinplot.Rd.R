library(BoutrosLab.plotting.general)


### Name: create.hexbinplot
### Title: Make a hexagonally binned plot
### Aliases: create.hexbinplot
### Keywords: hplot

### ** Examples

## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     x <- rnorm(10000),
##D     y <- rnorm(10000)
##D     );
##D 
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Simple.tiff'),
##D     formula = y ~ x,
##D     data = simple.data,
##D     main = 'Simple',
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Set up data
##D hexbin.data <- data.frame(
##D     x = microarray[,1],
##D     y = microarray[,2]
##D     );
##D 
##D # Minimal Input
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Minimal_Input.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Minimal input',
##D     # formatting bins
##D     colourcut = seq(0, 1, length = 11),
##D     # this sets the maximum value plotted -- values greater than this will not appear
##D     maxcnt = 50,
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Axes_Labels.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Axes & labels',
##D     colourcut = seq(0, 1, length = 11),
##D     maxcnt = 50,
##D     # Customize Axes and labels
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Aspect Ratio
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Aspect_Ratio.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Aspect ratio',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     colourcut = seq(0, 1, length = 11),
##D     maxcnt = 50,
##D     # Set the aspect ratio to control plot dimensions
##D     aspect = 2,
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour scheme
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Colour_Change.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Colour change',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     aspect = 1,
##D     colourcut = seq(0, 1, length = 11),
##D     maxcnt = 50,
##D     # Specify colour scheme
##D     colour.scheme = colorRampPalette(c('dodgerblue','paleturquoise','chartreuse','yellow',
##D         'orange','red')),
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Bin sizes
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Bin_Sizes.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Bin sizes',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     aspect = 1,
##D     colour.scheme = colorRampPalette(c('dodgerblue','paleturquoise','chartreuse', 'yellow',
##D         'orange','red')),
##D     # Specify bin sizes
##D     colourcut = seq(0,1,length = 6),
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Correlation Key
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Correlation.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Correlation',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     aspect = 1,
##D     colourcut = seq(0, 1, length = 11),
##D     maxcnt = 50,
##D     # Correlation Key
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = get.corr.key(
##D                     x = hexbin.data$x,
##D                     y = hexbin.data$y,
##D                     label.items = c('beta1', 'spearman'),
##D                     alpha.background = 0
##D                     )
##D                 ),
##D             x = 0.05,
##D             y = 0.95,
##D             corner = c(0,1),
##D             draw = FALSE
##D             )
##D         ),
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Grid lines and diagonal
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Gridlines.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Gridlines',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     aspect = 1,
##D     colourcut = seq(0, 1, length = 11),
##D     maxcnt = 50,
##D     # Grid & diagonal
##D     add.grid = TRUE,
##D     add.xyline = TRUE,
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Large range
##D # Generate some fake data with both very low and very high values
##D set.seed(12345);
##D 
##D x <- c(rnorm(100000,0,0.1),rnorm(1000,0,0.5),rnorm(1000,0,sd=0.75));
##D y <- c(rnorm(100000,0,0.1),rnorm(1000,0,0.5),rnorm(1000,0,sd=0.75));
##D 
##D fake.data <- data.frame(
##D     x = x,
##D     y = y,
##D     z = y + x*(x+1)/4
##D     );
##D 
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Range.tiff'),
##D     formula = z ~ x,
##D     data = fake.data,
##D     main = 'Range',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     aspect = 1,
##D     # Use colourcut to divide the bins appropriately
##D     colourcut = c(0,0.0002,0.0004,0.0008,0.0016,0.0032,0.0064,0.0128,0.0256,0.0512,0.1024,0.2048,
##D         0.4096,0.8192,1),
##D     # Change the colour scheme
##D     colour.scheme = function(n){BTC(n, beg=1, end=256)},
##D     background.col = 'grey',
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Outliers
##D # Generate data with upper bound outlier
##D set.seed(12345);
##D 
##D x <- c(rnorm(1000,0,0),rnorm(4000,0,0.5));
##D y <- c(rnorm(1000,0,0),rnorm(4000,0,0.5));
##D 
##D fake.data.outlier <- data.frame(
##D     x = x,
##D     y = y,
##D     z = y + x*(x+1)/4
##D     );
##D 
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Outlier.tiff'),
##D     formula = z ~ x,
##D     data = fake.data.outlier,
##D     main = 'Outlier',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlab.label = 'Sample 1',
##D     ylab.label = 'Sample 2',
##D     aspect = 1,
##D     # Use colourcut to divide the bins appropriately
##D     colourcut = c(seq(0,0.01, length = 4),seq(0.0125,0.1,length=4), seq(0.125,1,length=4)),
##D     xbins = 15,
##D     mincnt = 0,
##D     # Change the colour scheme
##D     colour.scheme = function(n){BTC(n, beg=1, end=256)},
##D     background.col = 'grey',
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.hexbinplot(
##D     filename = paste0(tempdir(),'/Hexbinplot_Nature_style.tiff'),
##D     formula = y ~ x,
##D     data = hexbin.data,
##D     main = 'Nature style',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,16),
##D     ylimits = c(0,16),
##D     xat = seq(0,16,2),
##D     yat = seq(0,16,2),
##D     aspect = 1,
##D     colourcut = seq(0, 1, length = 11),
##D     maxcnt = 50,
##D     # Grid & diagonal
##D     add.grid = TRUE,
##D     add.xyline = TRUE,
##D 
##D     # set style to Nature
##D     style = 'Nature',
##D 
##D     # demonstrating how to italicize character variables
##D     ylab.lab = expression(paste('italicized ', italic('a'))),
##D 
##D     # demonstrating how to create en-dashes
##D     xlab.lab = expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3)),
##D 
##D     description = 'Hexbinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Multiplot different groups
##D set.seed(73);
##D # Randomly generate groups
##D groups <- sample(1:2, 10000, replace = TRUE);
##D 
##D create.hexbinplot(
##D 	formula = y ~ x | groups,
##D 	filename = paste0(tempdir(),'/stratified_hexbinplot.tiff'),
##D 	data = simple.data,
##D 	description = 'Hexbinplot created by BoutrosLab.plotting.general',
##D 	strip.col = 'white',
##D 	strip.cex = 0.8,
##D 	strip.fontface = 'bold'
##D 	);
## End(Not run)



