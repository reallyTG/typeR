library(BoutrosLab.plotting.general)


### Name: create.segplot
### Title: Make a segplot
### Aliases: create.segplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     min = runif(10,5,15),
##D     max = runif(10,15,25),
##D     labels = as.factor(LETTERS[1:10])
##D     );
##D 
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_simple.tiff'),
##D     formula = labels ~ min + max,
##D     data = simple.data
##D     );
##D 
##D # load some data
##D length.of.gene <- apply(microarray[1:10,60:61], 1, diff);
##D bin.length <- length.of.gene;
##D bin.length[which(bin.length < 20000)] <- 'A';
##D bin.length[which(bin.length < 40000)] <- 'B';
##D bin.length[which(bin.length < 60000)] <- 'C';
##D 
##D segplot.data <- data.frame(
##D     min = apply(microarray[1:10,1:58], 1, min),
##D     max = apply(microarray[1:10,1:58], 1, max),
##D     median = apply(microarray[1:10,1:58], 1, median),
##D     gene = rownames(microarray)[1:10],
##D     # approximating length of gene 
##D     length = as.factor(bin.length)
##D     );
##D 
##D # Minimal Input using real data
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Minimal_Input.tiff'),
##D     formula = gene ~ min + max,
##D     data = segplot.data,
##D     main = 'Minimal input',
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Axes_Labels.tiff'),
##D     formula = gene ~ min + max,
##D     data = segplot.data,
##D     main = 'Axes & labels',
##D     # Formatting axes
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Bands
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Bands.tiff'),
##D     formula = gene ~ min + max,
##D     data = segplot.data,
##D     main = 'Bands',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     # drawing rectangles instead of lines
##D     draw.bands = TRUE,
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colours
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Colours.tiff'),
##D     formula = reorder(gene, median) ~ min + max,
##D     data = segplot.data,
##D     main = 'Colours',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     draw.bands = FALSE,
##D     # Changing the colours based on a covariate ('level' parameter)
##D     level = segplot.data$length,
##D     col.regions = default.colours(3),
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Median
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Median.tiff'),
##D     formula = gene ~ min + max,
##D     data = segplot.data,
##D     main = 'Medians',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     draw.bands = FALSE,
##D     xat = seq(0, 12, 2),
##D     level = segplot.data$length,
##D     col.regions = default.colours(3),
##D     # Adding center values
##D     centers = segplot.data$median,
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Reorder by center value
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Reorder.tiff'),
##D     formula = reorder(gene, median) ~ min + max,
##D     data = segplot.data,
##D     main = 'Reordered',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     draw.bands = FALSE,
##D     centers = segplot.data$median,
##D     level = segplot.data$length,
##D     col.regions = default.colours(3),
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Legend
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Legend.tiff'),
##D     formula = reorder(gene, median) ~ min + max,
##D     data = segplot.data,
##D     main = 'Legend',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     draw.bands = FALSE,
##D     centers = segplot.data$median,
##D     level = segplot.data$length,
##D     col.regions = default.colours(3),
##D     # Adding legend to explain colours
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 19,
##D                         cex = 1
##D                         ),
##D                     text = list(
##D                         lab = c('1-20000 bp', '20001-40000 bp','40001-60000 bp')
##D                         ),
##D                     padding.text = 1,
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.60,
##D             y = 0.15,
##D             corner = c(0,1)
##D             )
##D         ),
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Background
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Background.tiff'),
##D     formula = reorder(gene, median) ~ min + max,
##D     data = segplot.data,
##D     main = 'Background rectangle',
##D     xlab.label = 'Change in gene expression',
##D     ylab.label = 'Gene',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     draw.bands = FALSE,
##D     centers = segplot.data$median,
##D     level = segplot.data$length,
##D     col.regions = default.colours(3),
##D     # Adding legend to explain colours
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 19,
##D                         cex = 1
##D                         ),
##D                     text = list(
##D                         lab = c('1-20000 bp', '20001-40000 bp','40001-60000 bp')
##D                         ),
##D                     padding.text = 1,
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.50,
##D             y = 0.15,
##D             corner = c(0,1)
##D             )
##D         ),
##D     # adding background shading
##D     add.rectangle = TRUE,
##D     xleft.rectangle = 0,
##D     ybottom.rectangle = seq(0.5, 8.5, 2),
##D     xright.rectangle = 13,
##D     ytop.rectangle = seq(1.5, 9.5, 2),
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_Nature_style.tiff'),
##D     formula = reorder(gene, median) ~ min + max,
##D     data = segplot.data,
##D     main = 'Nature style',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xlimits = c(0,13),
##D     xat = seq(0, 12, 2),
##D     draw.bands = FALSE,
##D     centers = segplot.data$median,
##D     level = segplot.data$length,
##D     col.regions = default.colours(3),
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 19,
##D                         cex = 1
##D                         ),
##D                     text = list(
##D                         lab = c('1-20000 bp', '20001-40000 bp','40001-60000 bp')
##D                         ),
##D                     padding.text = 1,
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.50,
##D             y = 0.15,
##D             corner = c(0,1)
##D             )
##D         ),
##D     add.rectangle = TRUE,
##D     xleft.rectangle = 0,
##D     ybottom.rectangle = seq(0.5, 8.5, 2),
##D     xright.rectangle = 13,
##D     ytop.rectangle = seq(1.5, 9.5, 2),
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
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
##D     description = 'Segplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # example of bands and lines
##D create.segplot(
##D     filename = paste0(tempdir(),'/Segplot_BandsAndLines.tiff'),
##D     formula = labels ~ min + max,
##D     data = simple.data,
##D     draw.bands = c(1,3,5,7,9)
##D     );
## End(Not run)



