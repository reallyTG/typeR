library(BoutrosLab.plotting.general)


### Name: create.boxplot
### Title: Make a boxplot
### Aliases: create.boxplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     x <- rnorm(1000),
##D     y <- rep('A',1000)
##D     );
##D 
##D create.boxplot(
##D     filename = paste0(tempdir(), '/Boxplot_Simple.tiff'),
##D     formula = y ~ x,
##D     data = simple.data,
##D     main = 'Simple',
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # add stripplot behind boxplot
##D create.boxplot(
##D     filename = paste0(tempdir(), '/Boxplot_with_Stripplot.tiff'),
##D     formula = y ~ x,
##D     data = simple.data,
##D     main = 'With Stripplot',
##D     add.stripplot = TRUE,
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # format data
##D reformatted.data <- data.frame(
##D     x <- as.vector(t(microarray[1:10,1:58])),
##D     y <- as.factor(rep(rownames(microarray[1:10,1:58]),each = 58))
##D     );
##D 
##D # Minimal Input
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Minimal_Input.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Minimal input',
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Minimal Input
##D create.boxplot(
##D     filename = paste0(tempdir(), '/Boxplot_Disable_Factor_Sorting_Input.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'No Factor Sorting',
##D     disable.factor.sorting = TRUE,
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes and labels
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Axes_Labels.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Axes & labels',
##D     # Adjusting axes size
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # Adding y-axis label
##D     ylab.label = 'Gene',
##D     # setting axes limits
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Sorting
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Sorted.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Sorting',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     ylab.label = 'Gene',
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # Reordered by median
##D     sample.order = 'increasing',
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour change
##D sex.colour <- recode.vector(
##D     patient$sex,
##D     list(
##D         dodgerblue = 'male',
##D         pink = 'female'
##D         )
##D     );
##D 
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Colour_Change.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Colour change',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     ylab.label = 'Gene',
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # Colour change
##D     col = sex.colour,
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Legend
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Legend.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Legend',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     ylab.label = 'Gene',
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     col = sex.colour,
##D     # legend
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 1.5,
##D                         fill = c('dodgerblue','pink')
##D                         ),
##D                     text = list(
##D                         lab = c('male','female')
##D                         ),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.03,
##D             y = 0.97,
##D             corner = c(0,1),
##D             draw = FALSE
##D             )
##D         ),
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Orientation
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Orientation.tiff'),
##D     # switch the order
##D     formula = x ~ y,
##D     data = reformatted.data,
##D     main = 'Orientation',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     # adjust the axes
##D     ylimits = c(0,13),
##D     yat = seq(0,12,2),
##D     # rotate the labels
##D     xaxis.rot = 90,
##D     xlab.label = 'Gene',
##D     xlab.cex = 1.5,
##D     col = sex.colour,
##D     # legend
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 1.5,
##D                         fill = c('dodgerblue','pink')
##D                         ),
##D                     text = list(
##D                         lab = c('male','female')
##D                         ),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.23,
##D             y = 0.97,
##D             corner = c(0,1),
##D             draw = FALSE
##D             )
##D         ),
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Background rectangle
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_BG_Rect.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Bg rectangle',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     ylab.label = 'Gene',
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # draw rectangle
##D     add.rectangle = TRUE,
##D     xleft.rectangle = 0,
##D     xright.rectangle = 13,
##D     ybottom.rectangle = seq(0.5, 8.5, 2),
##D     ytop.rectangle = seq(1.5, 9.5, 2),
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
##D     col = sex.colour,
##D     # legend
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 1.5,
##D                         fill = c('dodgerblue','pink')
##D                         ),
##D                     text = list(
##D                         lab = c('male','female')
##D                         ),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.03,
##D             y = 0.97,
##D             corner = c(0,1),
##D             draw = FALSE
##D             )
##D         ),
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Line
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Line.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Line',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     ylab.label = 'Gene',
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # draw line
##D     line.func = function(x){c(0.5, 10.5)},
##D     line.from = 11,
##D     line.to = 11,
##D     line.col = 'grey',
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Panel Organization
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Panels.tiff'),
##D     formula = ~ x | y,
##D     data = reformatted.data,
##D     main = 'Panels',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # Setting up the layout
##D     layout = c(2,5),
##D     x.relation = 'free',
##D     x.spacing = 1,
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature format
##D create.boxplot(
##D     filename = paste0(tempdir(),'/Boxplot_Nature_style.tiff'),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Nature style',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D 
##D     # set style to Nature
##D     style = 'Nature',
##D 
##D     # demonstrating how to italicize character variables
##D     ylab.lab = expression(paste('italicized ', italic('a'))),
##D 
##D     # demonstrating how to create en-dashes
##D     xlab.lab = expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3))
##D     );
##D 
##D # Sorting by mean and multiple filenames
##D create.boxplot(
##D     filename = c(paste0(tempdir(),'/Boxplot_Sorted1.tiff'),
##D 	paste0(tempdir(),'/Boxplot_Sorted2.tiff')),
##D     formula = y ~ x,
##D     data = reformatted.data,
##D     main = 'Sorting',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     ylab.label = 'Gene',
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # Reordered by median
##D     sample.order = 'increasing',
##D     order.by = 'mean',
##D     description = 'Boxplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D 
##D # Adding text to plot
##D # Generate normally distributed variables with two different means
##D set.seed(779);
##D groupA <- rnorm(n = 100, mean = 10, sd = 2);
##D groupB <- rnorm(n = 134, mean = 10.5, sd = 2);
##D 
##D # Create data frame for plotting
##D to.plot <- data.frame(
##D 	y = rep(
##D 		c('1', '2'),
##D 		times = c(100, 134)
##D 		),
##D 	x = c(groupA, groupB)
##D 	);
##D 
##D # Get difference between means
##D diff.mean <- round(mean(groupB) - mean(groupA), 2);
##D 
##D # Plot and display difference
##D create.boxplot(
##D 	formula = x ~ y,
##D 	filename = paste0(tempdir(),'/boxplot_with_text.tiff'),
##D 	data = to.plot,
##D 	add.stripplot = TRUE,
##D 	add.text = TRUE,
##D 	text.labels = bquote(mu[B] - mu[A] == .(diff.mean)),
##D 	text.x = 2.1,
##D 	text.y = 15.3,
##D 	text.col = 'black',
##D 	text.cex = 1.5,
##D 	text.fontface = 'bold',
##D 	ylimits = c(
##D 		min(to.plot$x) - abs(min(to.plot$x) * 0.1),
##D 		max(to.plot$x) + abs(max(to.plot$x) * 0.1)
##D 		)
##D     );
## End(Not run)



