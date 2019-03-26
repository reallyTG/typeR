library(BoutrosLab.plotting.general)


### Name: create.violinplot
### Title: Make a violin plot
### Aliases: create.violinplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     x = c(rep(rnorm(50),5)),
##D     y = as.factor(sample(LETTERS[1:5],250,TRUE))
##D     );
##D 
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Simple.tiff'),
##D     formula = x ~ y,
##D     data = simple.data
##D     );
##D 
##D # load real datasets
##D violin.data <- data.frame(
##D     values = c(t(microarray[1:10, 1:58])),
##D     genes = rep(rownames(microarray)[1:10], each = 58),
##D     sex = patient$sex
##D     );
##D 
##D # Minimal input 
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Minimal_Input.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Minimal input',
##D     xaxis.rot = 90,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Axes_Labels.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Axes & labels',
##D     xaxis.rot = 90,
##D     # Adjusting axes
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 13),
##D     yat = seq(0, 12, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Range
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Range.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Range',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     # adjusted y-axis limits
##D     ylimits = c(0, 11),
##D     yat = seq(0, 10, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # Specify range
##D     start = 1,
##D     end = 10,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Scaling
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Scale.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Scale',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 13),
##D     yat = seq(0, 12, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # Scale
##D     scale = TRUE,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Extra points
##D median.points <- unlist(tapply(violin.data$values, violin.data$genes, median));
##D top.points <- unlist(tapply(violin.data$values, violin.data$genes, quantile, 0.90));
##D 
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Points.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Extra points',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 13),
##D     yat = seq(0, 12, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # Adding median and 90th percentile
##D     extra.points = list(median.points, top.points),
##D     extra.points.pch = 21,
##D     extra.points.col = c('white','grey'),
##D     extra.points.cex = 0.5,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colours
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Colour.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Colour',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 13),
##D     yat = seq(0, 12, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     extra.points = list(median.points, top.points),
##D     extra.points.pch = 21,
##D     extra.points.col = c('white','grey'),
##D     extra.points.cex = 0.5,
##D     # Colour
##D     col = 'dodgerblue',
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Custom labels
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Custom_Labels.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Custom labels',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 16),
##D     yat = c(0,1,2,4,8,16),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     extra.points = list(median.points, top.points),
##D     extra.points.pch = 21,
##D     extra.points.col = c('white','grey'),
##D     extra.points.cex = 0.5,
##D     col = 'dodgerblue',
##D     # customizing labels
##D     yaxis.lab = c(
##D         0,
##D         expression(paste('2'^'0')),
##D         expression(paste('2'^'1')),
##D         expression(paste('2'^'2')),
##D         expression(paste('2'^'4')),
##D         expression(paste('2'^'5'))
##D         ),
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Orientation
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Orientation.tiff'),
##D     # switch formula
##D     formula = genes ~ values,
##D     data = violin.data,
##D     main = 'Orientation',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     ylab.label = 'Gene',
##D     xlab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     extra.points = list(median.points, top.points),
##D     extra.points.pch = 21,
##D     extra.points.col = c('white','grey'),
##D     extra.points.cex = 0.5,
##D     col = 'dodgerblue',
##D     # orientation
##D     plot.horizontal = TRUE,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # background
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Background.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Background rectangle',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 13),
##D     yat = seq(0, 12, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.label = 'Gene',
##D     ylab.label = 'Change in expression',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     extra.points = list(median.points, top.points),
##D     extra.points.pch = 21,
##D     extra.points.col = c('white','grey'),
##D     extra.points.cex = 0.5,
##D     col = 'dodgerblue',
##D     # background
##D     add.rectangle = TRUE,
##D     xleft.rectangle = seq(0.5, 8.5, 2),
##D     ybottom.rectangle = 0,
##D     xright.rectangle = seq(1.5, 9.5, 2),
##D     ytop.rectangle = 13,
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.violinplot(
##D     filename = paste0(tempdir(),'/Violinplot_Nature_style.tiff'),
##D     formula = values ~ genes,
##D     data = violin.data,
##D     main = 'Nature style',
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylimits = c(0, 13),
##D     yat = seq(0, 12, 2),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     col = 'dodgerblue',
##D     add.rectangle = TRUE,
##D     xleft.rectangle = seq(0.5, 8.5, 2),
##D     ybottom.rectangle = 0,
##D     xright.rectangle = seq(1.5, 9.5, 2),
##D     ytop.rectangle = 13,
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
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
##D     description = 'Violinplot created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



