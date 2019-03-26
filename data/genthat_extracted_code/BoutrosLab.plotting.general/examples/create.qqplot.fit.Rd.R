library(BoutrosLab.plotting.general)


### Name: create.qqplot.fit
### Title: Make a quantile-quantile plot of a sample
### Aliases: create.qqplot.fit
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Simple.tiff'),
##D     x = rnorm(300),
##D     # choosing to compare against a uniform distribution
##D     distribution = qunif
##D     );
##D 
##D # Minimal Input
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Minimal_Input.tiff'),
##D     x = microarray[1:500,1],
##D     # choosing to compare against a uniform distribution
##D     distribution = qunif,
##D     main = 'Minimal input',
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes and Labels
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Axes_Labels.tiff'),
##D     x = microarray[1:500,1],
##D     distribution = qunif,
##D     main = 'Axes & labels',
##D     # Adding axes labels
##D     xlab.label = 'qunif',
##D     ylab.label = 'sample values',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     add.grid = TRUE,
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Confidence bands 
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Confidence_Bands.tiff'),
##D     x = microarray[1:500,1],
##D     distribution = qunif,
##D     main = 'Confidence bands',
##D     xlab.label = 'qunif',
##D     ylab.label = 'sample values',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     add.grid = TRUE,
##D     # Adding confidence bands (auto-generates legend)
##D     confidence.bands = TRUE,
##D     confidence.method = 'both',
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Multiple qq plot conditioned on a variable
##D # 'Formula' format of data
##D chr.locations <- microarray$Chr[1:500];
##D chr.locations <- replace(chr.locations, which(chr.locations == 1), 'Chromosome 1');
##D chr.locations <- replace(chr.locations, which(chr.locations == 2), 'Chromosome 2');
##D 
##D qqplot.data <- data.frame(
##D     value = microarray[1:500,1],
##D     chr = chr.locations
##D     );
##D 
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Multiple.tiff'),
##D     x = ~ value | chr,
##D     data = qqplot.data,
##D     distribution = qunif,
##D     main = 'Multiple plots',
##D     xlab.label = 'qunif',
##D     ylab.label = 'sample values',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     add.grid = TRUE,
##D     confidence.bands = TRUE,
##D     confidence.method = 'simultaneous',
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Grouped qq plot
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Grouped.tiff'),
##D     x = ~ value,
##D     data = qqplot.data,
##D     # Adding groups
##D     groups = qqplot.data$chr,
##D     # Colouring groups
##D     col = default.colours(2),
##D     # Setting different plotting characters
##D     pch = c(15, 19),
##D     distribution = qunif,
##D     main = 'Grouped & legend',
##D     xlab.label = 'qunif',
##D     ylab.label = 'sample values',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     add.grid = TRUE,
##D     confidence.bands = TRUE,
##D     confidence.method = 'simultaneous',
##D     # Adding legend for groups
##D     key = list(
##D         text = list(
##D             lab = c('1','2'),
##D             cex = 1,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = c(15, 19),
##D             col = default.colours(2),
##D             cex = 1
##D             ),
##D         x = 0.04,
##D         y = 0.95,
##D         padding.text = 2
##D         ),
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Correlation Key
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Correlation_Key.tiff'),
##D     x = ~ value,
##D     data = qqplot.data,
##D     groups = qqplot.data$chr,
##D     col = default.colours(2),
##D     pch = c(15, 19),
##D     distribution = qunif,
##D     main = 'Correlation key',
##D     xlab.label = 'qunif',
##D     ylab.label = 'sample values',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     add.grid = TRUE,
##D     confidence.bands = TRUE,
##D     confidence.method = 'simultaneous',
##D     # Adjusting legend to contain multiple keys
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                         text = list(
##D                             lab = c('1','2'),
##D                             cex = 1,
##D                             col = 'black'
##D                             ),
##D                         points = list(
##D                             pch = c(15, 19),
##D                             col = default.colours(2),
##D                             cex = 1
##D                             ),
##D                         x = 0.14,
##D                         y = 0.80,
##D                         padding.text = 2
##D                     )
##D                 )
##D             ),
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = get.corr.key(
##D                     x = runif(500),
##D                     y = qqplot.data$value,
##D                     label.items = c('spearman', 'kendall','beta1'),
##D                     alpha.background = 0,
##D                     key.cex = 1
##D                     )
##D                 ),
##D             x = 0.75,
##D             y = 0.20,
##D             corner = c(0,1)
##D             )
##D         ),
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.qqplot.fit(
##D     filename = paste0(tempdir(),'/QQfit_Nature_style.tiff'),
##D     x = microarray[1:500,1],
##D     distribution = qunif,
##D     main = 'Nature style',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     add.grid = TRUE,
##D     confidence.bands = TRUE,
##D     confidence.method = 'both',
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
##D     description = 'QQplot fit created by BoutrosLab.plotting.general'
##D     );
##D 
## End(Not run)



