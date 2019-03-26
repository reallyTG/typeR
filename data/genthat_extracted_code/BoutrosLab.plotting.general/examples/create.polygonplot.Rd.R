library(BoutrosLab.plotting.general)


### Name: create.polygonplot
### Title: Make a polygonplot
### Aliases: create.polygonplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D temp  <- matrix(runif(1010), ncol = 10) + sort(runif(101));
##D 
##D simple.data <- data.frame(
##D     x = 0:100,
##D     max = apply(temp, 1, max),
##D     min = apply(temp, 1, min)
##D     );
##D 
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Simple.tiff'),
##D     formula = NA ~ x,
##D     data = simple.data,
##D     max = simple.data$max,
##D     min = simple.data$min,
##D     main = 'Simple',
##D     xlimits = c(0,100),
##D     ylimits = c (0,2),
##D     col = default.colours(1),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Compare two genes across increasing numbers of samples
##D data1 <- microarray[1,1:58];
##D data2 <- microarray[2,1:58];
##D 
##D gene1 <- as.data.frame(matrix(nrow = 58, ncol = 58));
##D gene2 <- as.data.frame(matrix(nrow = 58, ncol = 58));
##D 
##D fill.matrix <- function(x, gene, data){
##D     for(i in x){
##D         gene[i, 1:i] <- rep(NA, i);
##D         gene[i, i:58] <- rep(as.numeric(data[i]), 58-i+1);
##D         }
##D     return(gene);
##D     }; 
##D 
##D gene1 <- fill.matrix(1:58, gene1, data1);
##D gene1 <- t(matrix(unlist(gene1), ncol = 58, byrow = TRUE));
##D 
##D gene2 <- fill.matrix(1:58, gene2, data2);
##D gene2 <- t(matrix(unlist(gene2), ncol = 58, byrow = TRUE));
##D 
##D # Set up the data
##D polygon.data.gene1 <- data.frame(
##D     x = 1:58,
##D     max = apply(gene1, 2, function(x) {max(x, na.rm = TRUE)}),
##D     median = apply(gene1, 2, function(x) {median(x, na.rm = TRUE)}),
##D     min = apply(gene1, 2, function(x) {min(x, na.rm = TRUE)}),
##D     set = rownames(microarray[1,]),
##D     extra = apply(microarray[1:58], 2, function(x) {median(x)})
##D     );
##D 
##D polygon.data.two.genes <- rbind(
##D     polygon.data.gene1,
##D     data.frame(
##D         x = 1:58,
##D         max = apply(gene2, 2, function(x) {max(x, na.rm = TRUE)}),
##D         median = apply(gene2, 2, function(x) {median(x, na.rm = TRUE)}),
##D         min = apply(gene2, 2, function(x) {min(x, na.rm = TRUE)}),
##D         set = rownames(microarray[2,]),
##D         extra = apply(microarray[1:58], 2, function(x) {median(x)})
##D         )
##D     )
##D 
##D # Minimal Input
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Minimal_Input.tiff'),
##D     formula = NA ~ x,
##D     data = polygon.data.gene1,
##D     max = polygon.data.gene1$max,
##D     min = polygon.data.gene1$min,
##D     main = 'Minimal input',
##D     xlimits = c(0,58),
##D     ylimits = c (2,5),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Axes_Labels.tiff'),
##D     formula = NA ~ x,
##D     data = polygon.data.gene1,
##D     max = polygon.data.gene1$max,
##D     min = polygon.data.gene1$min,
##D     main = 'Axes & labels',
##D     xlimits = c(0,58),
##D     ylimits = c (0,10),
##D     # Axes & Labels
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 10, 2),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Colour.tiff'),
##D     formula = NA ~ x,
##D     data = polygon.data.gene1,
##D     max = polygon.data.gene1$max,
##D     min = polygon.data.gene1$min,
##D     main = 'Colour',
##D     xlimits = c(0,58),
##D     ylimits = c (0,10),
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 10, 2),
##D     # Colour
##D     col = default.colours(1),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Add median line and points
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Median_Points.tiff'),
##D     formula = NA ~ x,
##D     data = polygon.data.gene1,
##D     max = polygon.data.gene1$max,
##D     min = polygon.data.gene1$min,
##D     # Median
##D     median = polygon.data.gene1$median,
##D     add.median = TRUE,
##D     main = 'Plotting character',
##D     xlimits = c(0,58),
##D     ylimits = c (0,10),
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 10, 2),
##D     col = default.colours(1),
##D     # border points
##D     add.xy.border = TRUE,
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Additional Data
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Extra_Data.tiff'),
##D     formula = NA ~ x,
##D     # divide data
##D     groups = set,
##D     data = polygon.data.two.genes,
##D     max = polygon.data.two.genes$max,
##D     min = polygon.data.two.genes$min,
##D     main = 'Two data sets',
##D     median = polygon.data.two.genes$median,
##D     add.median = TRUE,
##D     xlimits = c(0,58),
##D     ylimits = c (0,15),
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 14, 2),
##D     # Increasing number of colours
##D     col = default.colours(2),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Legend
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Legend.tiff'),
##D     formula = NA ~ x,
##D     groups = set,
##D     data = polygon.data.two.genes,
##D     max = polygon.data.two.genes$max,
##D     min = polygon.data.two.genes$min,
##D     main = 'Legend',
##D     median = polygon.data.two.genes$median,
##D     add.median = TRUE,
##D     xlimits = c(0,58),
##D     ylimits = c (0,15),
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 14, 2),
##D     col = default.colours(2),
##D     # Adding legend
##D     key = list(
##D         text = list(
##D             lab = rownames(microarray[1:2,]),
##D             cex = 0.8,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 15,
##D             col = default.colours(2),
##D             cex = 2
##D             ),
##D         x = 0.04,
##D         y = 0.93,
##D         padding.text = 3,
##D         columns = 1
##D         ),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Panel Organiation
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Panel.tiff'),
##D     # divide data
##D     formula = NA ~ x | set,
##D     data = polygon.data.two.genes,
##D     max = polygon.data.two.genes$max,
##D     min = polygon.data.two.genes$min,
##D     main = 'Panel',
##D     median = polygon.data.two.genes$median,
##D     add.median = TRUE,
##D     xlimits = c(0,58),
##D     ylimits = c (0,15),
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 14, 2),
##D     col = default.colours(1),
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Extra Points
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Extra_Points.tiff'),
##D     formula = NA ~ x,
##D     groups = set,
##D     data = polygon.data.two.genes,
##D     max = polygon.data.two.genes$max,
##D     min = polygon.data.two.genes$min,
##D     main = 'Extra points',
##D     median = polygon.data.two.genes$median,
##D     add.median = TRUE,
##D     xlimits = c(0,58),
##D     ylimits = c (0,15),
##D     xlab.label = 'Samples',
##D     ylab.label = 'Value',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 14, 2),
##D     col = default.colours(2),
##D     # Add to legend
##D     key = list(
##D         text = list(
##D             lab = c(rownames(microarray[1:2,]), 'All genes'),
##D             cex = 0.8,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = c(15, 15, 3),
##D             col = c(default.colours(2), 'red'),
##D             cex = c(2, 2, 0.7)
##D             ),
##D         x = 0.04,
##D         y = 0.93,
##D         padding.text = 3,
##D         columns = 1
##D         ),
##D     # Extra points
##D     extra.points = list(
##D         x = polygon.data.two.genes$x,
##D         y = polygon.data.two.genes$extra
##D         ),
##D     extra.points.col = 'red',
##D     extra.points.pch = 3,
##D     extra.points.type = c('p', 'l'),
##D     extra.points.cex = 0.7,
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.polygonplot(
##D     filename = paste0(tempdir(),'/Polygon_Nature_style.tiff'),
##D     formula = NA ~ x,
##D     groups = set,
##D     data = polygon.data.two.genes,
##D     max = polygon.data.two.genes$max,
##D     min = polygon.data.two.genes$min,
##D     main = 'Nature style',
##D     median = polygon.data.two.genes$median,
##D     add.median = TRUE,
##D     xlimits = c(0,58),
##D     ylimits = c (0,15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xat = seq(0, 58, 5),
##D     yat = seq(0, 14, 2),
##D     col = default.colours(2),
##D     # Adding legend
##D     key = list(
##D         text = list(
##D             lab = rownames(microarray[1:2,]),
##D             cex = 0.8,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 15,
##D             col = default.colours(2),
##D             cex = 2
##D             ),
##D         x = 0.04,
##D         y = 0.93,
##D         padding.text = 3,
##D         columns = 1
##D         ),
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
##D     description = 'Polygon created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



