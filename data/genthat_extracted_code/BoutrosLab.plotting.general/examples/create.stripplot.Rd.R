library(BoutrosLab.plotting.general)


### Name: create.stripplot
### Title: Make a strip-plot
### Aliases: create.stripplot
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
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_simple.tiff'),
##D     formula = x ~ y,
##D     data = simple.data
##D     );
##D 
##D # load real datasets
##D stripplot.data <- data.frame(
##D     values = c(t(microarray[1:10, 1:58])),
##D     genes = rep(rownames(microarray)[1:10], each = 58),
##D     sex = patient$sex 
##D     );
##D 
##D # Minimal Input using real data
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_Minimal_Input.tiff'),
##D     formula = genes ~ values,
##D     data = stripplot.data,
##D     main = 'Minimal input',
##D     description = 'Stripplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_Axes_Labels.tiff'),
##D     formula = genes ~ values,
##D     data = stripplot.data,
##D     main = 'Axes & labels',
##D     # formatting axes
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     description = 'Stripplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour & Legend
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_Colour_Legend.tiff'),
##D     formula = genes ~ values,
##D     data = stripplot.data,
##D     main = 'Colour & legend',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     # Colour & points adjustment
##D     groups = stripplot.data$sex,
##D     col = c('pink', 'skyblue'),
##D     pch = 19,
##D     colour.alpha = 0.5,
##D     cex = 1,
##D     # Legend
##D     key = list(
##D         space = 'right',
##D         text = list(
##D             lab = levels(stripplot.data$sex),
##D             cex = 1,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 19,
##D             col = c('pink','skyblue'),
##D             alpha = 0.5,
##D             cex = 1
##D             ),
##D         padding.text = 3
##D         ),
##D     description = 'Stripplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Jitter
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_Jitter.tiff'),
##D     formula = genes ~ values,
##D     data = stripplot.data,
##D     main = 'Low Jitter',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     groups = stripplot.data$sex,
##D     col = c('pink', 'skyblue'),
##D     pch = 19,
##D     colour.alpha = 0.5,
##D     cex = 1,
##D     key = list(
##D         space = 'right',
##D         text = list(
##D             lab = levels(stripplot.data$sex),
##D             cex = 1,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 19,
##D             col = c('pink','skyblue'),
##D             alpha = 0.4,
##D             cex = 1
##D             ),
##D         padding.text = 3
##D         ),
##D     # Custom jitter
##D     jitter.data = TRUE,
##D     description = 'Stripplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Jitter
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_High_Jitter.tiff'),
##D     formula = genes ~ values,
##D     data = stripplot.data,
##D     main = 'High Jitter',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     groups = stripplot.data$sex,
##D     col = c('pink', 'skyblue'),
##D     pch = 19,
##D     colour.alpha = 0.5,
##D     cex = 1,
##D     key = list(
##D         space = 'right',
##D         text = list(
##D             lab = levels(stripplot.data$sex),
##D             cex = 1,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 19,
##D             col = c('pink','skyblue'),
##D             alpha = 0.4,
##D             cex = 1
##D             ),
##D         padding.text = 3
##D         ),
##D     # Custom jitter
##D     jitter.data = TRUE,
##D     jitter.factor = 0.5,
##D     jitter.amount = 0.33,
##D     description = 'Stripplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.stripplot(
##D     filename = paste0(tempdir(),'/Stripplot_Nature_style.tiff'),
##D     formula = genes ~ values,
##D     data = stripplot.data,
##D     main = 'Nature style',
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlimits = c(0,13),
##D     xat = seq(0,12,2),
##D     groups = stripplot.data$sex,
##D     col = c('pink', 'skyblue'),
##D     pch = 19,
##D     colour.alpha = 0.5,
##D     cex = 1,
##D     key = list(
##D         space = 'right',
##D         text = list(
##D             lab = levels(stripplot.data$sex),
##D             cex = 1,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 19,
##D             col = c('pink','skyblue'),
##D             alpha = 0.4,
##D             cex = 1
##D             ),
##D         padding.text = 3
##D         ),
##D     jitter.data = TRUE,
##D     jitter.factor = 0.5,
##D     jitter.amount = 0.33,
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
##D     description = 'Stripplot created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



