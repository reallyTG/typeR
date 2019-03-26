library(BoutrosLab.plotting.general)


### Name: create.heatmap
### Title: Make a heatmap
### Aliases: create.heatmap
### Keywords: hplot cluster

### ** Examples


## Not run: 
##D set.seed(12345);
##D simple.data <- data.frame(
##D     x <- rnorm(n = 15),
##D     y <- rnorm(n = 15),
##D     z <- rnorm(n = 15),
##D     v <- rnorm(n = 15),
##D     w <- rnorm(n = 15)
##D     );
##D 
##D simple.1D.data <- data.frame(x = rnorm(n = 15)); 
##D 
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(), "/Heatmap_1D_Inside_Legend.tiff"),
##D     x = simple.1D.data, 
##D     clustering.method='none',
##D     inside.legend = list(fun = draw.key,
##D         args = list(
##D 	    key = list(
##D                 text = list(
##D                     lab = c('test','test','test','test'),
##D                     cex = 1,
##D                     fontface = 'bold'
##D                     ),
##D                 padding.text = 3,
##D                 background = 'white',
##D 		alpha.background = 0
##D                 )
##D             ),
##D         x = 0.5,
##D         y = 0.5
##D         )
##D     )
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(), '/Heatmap_Simple.tiff'),
##D     x = simple.data,
##D     main = 'Simple',
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D simple.data.col <- data.frame(
##D     x <- c('blue','green','red','yellow','blue','red','black','white','purple','grey'),
##D     y <- rep('red',10),
##D     z <- rep('yellow',10),
##D     v <- rep('green',10),
##D     w <- rep('purple',10)
##D     );
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Simple_Using_Colours.tiff'),
##D     x = simple.data.col, 
##D     clustering.method = 'none',
##D     input.colours = TRUE
##D     )
##D # Minimal Input
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Minimal_Input.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Minimal input',
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes and labels
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Axes_Labels.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Axes & labels',
##D     # Changing axes 
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     # Turning on default row and column labels
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     # Adjusting font sizes
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Changing colourkey
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Custom Axes 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Custom_Axes.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Customized axes',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     # Specify where to place tick marks
##D     colourkey.labels.at = c(3,4, 6, 7, 10, 11),
##D     # Specify label colours (note: this is based on the pre-clustering order)
##D     xaxis.col = c('black', 'red',rep('black',6), 'red','black', 'black','red',rep('black',8)),
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Two-sided Colour Scheme
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Colour_Scheme_1.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Colour scheme',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     # Changing the colours
##D     colour.scheme = c('white','firebrick'),
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Three-sided Colour Scheme
##D # Note: when using a three-sided colour scheme, it is advised to have two-sided data
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Colour_Scheme_2.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Colour scheme',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     # Changing the colours
##D     colour.scheme = c('red','white','turquoise'),
##D     # Scale the data to center around the mean
##D     scale.data = TRUE,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour Alpha
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Colour_Alpha.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Colours alpha',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     # Adjusting the alpha value of the colours
##D     colour.alpha = 'automatic',
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Clustering
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_No_Clustering.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'No clustering',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     # Turning clustering off
##D     clustering.method = 'none',
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Clustering
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Clustering_Methods.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Clustering methods',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     # Clustering method defaults to 'diana', but can be set to other options
##D     clustering.method = 'complete',
##D     # Also setting the distance measures
##D     rows.distance.method = 'euclidean',
##D     cols.distance.method = 'manhattan',
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Stratified Clustering
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Stratified_Clustering.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Stratified clustering',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     # Stratifying the clustering by rows
##D     stratified.clusters.rows = list(c(1:10), c(11:20)),
##D     # Adding line to show highlight the division between the two strata
##D     grid.row = TRUE,
##D     row.lines = 10.5,
##D     row.lwd = 2,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Dendrogram provided
##D col.dendrogram <- BoutrosLab.plotting.general::create.dendrogram(
##D     x = microarray[1:20, 1:20],
##D     cluster.dimension = 'col'
##D     );
##D 
##D row.dendrogram <- BoutrosLab.plotting.general::create.dendrogram(
##D     x = microarray[1:20, 1:20],
##D     cluster.dimension = 'row'
##D     );
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Dendrogram_Provided.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Dendrogram provided',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     # note: row/column dendrograms are switched because the function inverts rows and columns
##D     clustering.method = 'none',
##D     row.dendrogram = col.dendrogram,
##D     col.dendrogram = row.dendrogram,
##D     # Adjusting the size of the dendrogram
##D     right.dendrogram.size = 3,
##D     top.dendrogram.size = 2.5,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Covariates and Legends
##D # Note: covariates can also be added using the create.multiplot function
##D # set the colour schemes for the covariates
##D sex.colours <- patient$sex;
##D sex.colours[sex.colours == 'male'] <- 'dodgerblue';
##D sex.colours[sex.colours == 'female'] <- 'pink';
##D 
##D stage.colours <- patient$stage;
##D stage.colours[stage.colours == 'I'] <- 'plum1';
##D stage.colours[stage.colours == 'II'] <- 'orchid1';
##D stage.colours[stage.colours == 'III'] <- 'orchid3';
##D stage.colours[stage.colours == 'IV'] <- 'orchid4';
##D 
##D # create an object to draw the covariates from
##D sample.covariate <- list(
##D     rect = list(
##D         col = 'black',
##D         fill = sex.colours,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'black',
##D         fill = stage.colours,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D # create a legend for the covariates
##D sample.cov.legend <- list(
##D     legend = list(
##D         colours = c('dodgerblue', 'pink'),
##D         labels = c('male','female'),
##D         title = 'Sex'
##D         ),
##D     legend = list(
##D         colours = c('plum1', 'orchid1','orchid3', 'orchid4'),
##D         labels = c('I','II', 'III', 'IV'),
##D         title = 'Stage'
##D         )
##D     );
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Covariates_Simple.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Covariates',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     # adding covariates and corresponding legend
##D     covariates = sample.covariate,
##D     covariate.legend = sample.cov.legend,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Top covariate and legend customization
##D chr.cov.colours <- microarray$Chr;
##D chr.cov.colours[microarray$Chr == 1] <- default.colours(3, palette.type = 'chromosomes')[1];
##D chr.cov.colours[microarray$Chr == 2] <- default.colours(3, palette.type = 'chromosomes')[2];
##D chr.cov.colours[microarray$Chr == 3] <- default.colours(3, palette.type = 'chromosomes')[3];
##D 
##D chr.covariate <- list(
##D     rect = list(
##D         col = 'white',
##D         fill = chr.cov.colours,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D # join covariate legends
##D combo.cov.legend <- list(
##D     legend = list(
##D         colours = default.colours(3, palette.type = 'chromosomes'),
##D         labels = c('1','2', '3'),
##D         title = 'Chromosome',
##D         border = 'white'
##D         ),
##D     legend = list(
##D         colours = c('dodgerblue', 'pink'),
##D         labels = c('male','female'),
##D         title = 'Sex'
##D         ),
##D     legend = list(
##D         colours = c('plum1', 'orchid1','orchid3', 'orchid4'),
##D         labels = c('I','II', 'III', 'IV'),
##D         title = 'Stage'
##D         )
##D     );
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Covariate_Legend_Custom.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Custom covariates & legend',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     clustering.method = 'none',
##D     # side covariate
##D     covariates = sample.covariate,
##D     # top covariate and covariate border specification
##D     covariates.top = chr.covariate,
##D     covariate.legend = combo.cov.legend,
##D     # making outline of border a matching green
##D     covariates.top.grid.border = list(col = 'lightblue', lwd = 2),
##D     # making certain column divisions a different colour
##D     covariates.top.col.lines = c(5,6),
##D     covariates.top.grid.col = list(col = 'blue', lwd = 2),
##D     # legend customization
##D     legend.side = c('right','left','top'),
##D     legend.title.cex = 0.75,
##D     legend.cex = 0.75,
##D     legend.title.just = 'left',
##D     legend.border = list(lwd = 1),
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Custom gridlines
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Gridlines.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Gridlines',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     # colouring gridlines
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     row.lwd = 1.5,
##D     col.lwd = 1.5,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Label cells
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Labelled_Cells.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Labelled cells',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     row.lwd = 1.5,
##D     col.lwd = 1.5,
##D     clustering.method = 'none',
##D     # conditionally labelling cells 
##D     # flipping rows and columns because the heatmap function does so
##D     row.pos = which(microarray[1:20, 1:20] > 11, arr.ind = TRUE)[,2],
##D     col.pos = which(microarray[1:20, 1:20] > 11, arr.ind = TRUE)[,1],
##D     cell.text = microarray[1:20, 1:20][microarray[1:20, 1:20] > 11],
##D     text.col = 'white',
##D     text.cex = 0.65,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D # Label cells
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Labelled_Cells_NPC.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Labelled cells',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     row.lwd = 1.5,
##D     col.lwd = 1.5,
##D     clustering.method = 'none',
##D     text.use.grid.coordinates = FALSE,
##D     # conditionally labelling cells 
##D     # flipping rows and columns because the heatmap function does so
##D     cell.text = c("text1","text2"),
##D     text.col = 'white',
##D     text.cex = 0.65,
##D     text.position = list(c(0.5,0.5),c(0.75,0.75)),
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Method 1 of adding symbols (very similar to how text is added)
##D points <- microarray[1:20, 1:20][microarray[1:20, 1:20] > 11];
##D size.from <- range(points, na.rm = TRUE);
##D size.to <- c(1,3);
##D point.size <- (points - size.from[1])/diff(size.from) * diff(size.to) + size.to[1];
##D point.colour <- grey(runif(sum(microarray[1:20, 1:20] > 11), max = 0.5));
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Symbols_1.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Symbols',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     clustering.method = 'none',
##D     # conditionally adding points to cells 
##D     # flipping rows and columns because the heatmap function does so
##D     row.pos = which(microarray[1:20, 1:20] > 11, arr.ind = TRUE)[,2],
##D     col.pos = which(microarray[1:20, 1:20] > 11, arr.ind = TRUE)[,1],
##D     cell.text = rep(expression("\u25CF"), times = sum(microarray[1:20, 1:20] > 11)),
##D     text.col = point.colour,
##D     text.cex = point.size,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Method 2 of Adding Symbols
##D # Create matrices to describe the symbols
##D circle.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = FALSE
##D     );
##D 
##D circle.colour.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = 'pink'
##D     );
##D 
##D circle.size.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = 20
##D     );
##D 
##D border.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = FALSE
##D     );
##D 
##D border.colour.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = 'black'
##D     );
##D 
##D border.size.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = 4
##D     );
##D 
##D square.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = FALSE
##D     );
##D 
##D square.colour.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = 'pink'
##D     );
##D 
##D square.size.matrix <- matrix(
##D     nrow = 20, 
##D     ncol = 20, 
##D     data = 10
##D     );
##D 
##D # setting up the symbols
##D symbol.locations <- list(
##D     circles = list(
##D         list(
##D             x = circle.matrix,
##D             col = circle.colour.matrix,
##D             size = circle.size.matrix
##D             )
##D         ),
##D     borders = list(
##D         list(
##D             x = border.matrix,
##D             col = border.colour.matrix,
##D             size = border.size.matrix
##D             ),
##D         # creating a border encompassing a larger area
##D         list(
##D             xright = 12.10,
##D             xleft = 12,
##D             ybottom = 1,
##D             ytop = 20,
##D             size = 4,
##D             col = 'pink'
##D             )
##D         ),
##D     squares = list(
##D         list(
##D             x = square.matrix,
##D             col = square.colour.matrix,
##D             size = square.size.matrix
##D             )
##D         )
##D     );
##D 
##D # Set which items in the matrix will be shown
##D 
##D # symbol.locations$borders[[1]]$x <- FALSE;
##D # symbol.locations$squares[[1]]$x <- FALSE;
##D symbol.locations$circles[[1]]$x[which(microarray[1:20,1:20] > 11, arr.ind = TRUE)] <- TRUE;
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Symbols_2.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Symbols',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     clustering.method = 'none',
##D     # adding symbols
##D     symbols = symbol.locations,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Rotate matrix
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Rotated_Matrix.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Rotated matrix',
##D     # Also flip labels
##D     ylab.label = 'Genes',
##D     xlab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = NA,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     colourkey.labels.at = seq(2,12,1),
##D     colour.alpha = 'automatic',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     row.lwd = 1.5,
##D     col.lwd = 1.5,
##D     # stop heatmap function from rotating matrix
##D     same.as.matrix = TRUE,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Example of using discrete data
##D discrete.data <- microarray[1:10,1:40];
##D # Looking for values greater than 10
##D discrete.data[which(discrete.data < 10, arr.ind = TRUE)] <- 0;
##D discrete.data[which(discrete.data > 0, arr.ind = TRUE)] <- 1;
##D 
##D sex.colour <- recode.vector(
##D     patient$sex,
##D     list(
##D         dodgerblue = 'male',
##D         pink = 'female'
##D         )
##D     );
##D 
##D stage.colour <- recode.vector(
##D     patient$stage,
##D     list(
##D         plum1 = 'I',
##D         orchid1 = 'II',
##D         orchid3 = 'III',
##D         orchid4 = 'IV'
##D         )
##D     );
##D 
##D msi.colour <- recode.vector(
##D     patient$msi,
##D     list(
##D         chartreuse4 = 'MSS',
##D         chartreuse2 = 'MSI-High'
##D         )
##D     );
##D 
##D discrete.covariate <- list(
##D     rect = list(
##D         col = 'transparent',
##D         fill = sex.colour,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'transparent',
##D         fill = stage.colour,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'transparent',
##D         fill = msi.colour,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D discrete.covariate.legend <- list(
##D     legend = list(
##D         colours = c('dodgerblue', 'pink'),
##D         labels = c('male','female'),
##D         title = expression(underline('Sex'))
##D         ),
##D     legend = list(
##D         colours = c('plum1', 'orchid1', 'orchid3', 'orchid4'),
##D         labels = c('I','II', 'III', 'IV'),
##D         title = expression(underline('Stage'))
##D         ),
##D     legend = list(
##D         colours = c('chartreuse4', 'chartreuse2'),
##D         labels = c('MSS','MSI-High'),
##D         title = expression(underline('MSI'))
##D         )
##D     );
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Discrete_Data.tiff'),
##D     x = discrete.data,
##D     main = 'Discrete data',
##D     xlab.label = 'Samples',
##D     same.as.matrix = TRUE,
##D     # Customize plot
##D     clustering.method = 'none',
##D     total.colours = 3,
##D     colour.scheme = c('white','black'),
##D     fill.colour = 'grey95',
##D     # Changing axes
##D     xat = seq(0,40,5),
##D     xaxis.lab = seq(0,40,5),
##D     yaxis.lab = rownames(microarray)[1:10],
##D     yaxis.cex = 0.75,
##D     xaxis.cex = 0.75,
##D     xaxis.rot = 0,
##D     xlab.cex = 1,
##D     # Covariates
##D     covariates.top = discrete.covariate,
##D     covariate.legend = discrete.covariate.legend,
##D     legend.side = 'right',
##D     legend.title.cex = 0.75,
##D     legend.cex = 0.75,
##D     legend.title.just = 'left',
##D     legend.between.row = 0.2,
##D     legend.border = list(col = 'transparent'),
##D     legend.border.padding = 2,
##D     shrink = 0.7,
##D     covariates.top.grid.border = list(col = 'black', lwd = 2),
##D     scale.data = FALSE,
##D     print.colour.key = FALSE,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Correlation matrix
##D # Example of how to visualize the relationship between (e.x.) different cellularity estimates
##D # Generate a correlation matrix
##D cor.data <- cor(t(microarray[1:10,1:10]), method = 'spearman');
##D colnames(cor.data) <- colnames(microarray)[1:10];
##D 
##D # ensure that input data matrix is equal to what the heatmap clustering produces
##D distance.matrix <- as.dist(1 - cor(t(cor.data), use = "pairwise", method = "pearson"));
##D clustered.order <- hclust(d = distance.matrix, method = "ward")$order;
##D cor.data <- cor.data[clustered.order, clustered.order];
##D 
##D # prepare labels
##D x <- round(cor.data, 2);
##D x[x == 1] <- colnames(x);
##D y <- x;
##D for (i in 1:(ncol(y)-1)) {
##D     y[i, (i+1):nrow(y)] <- "";
##D     };
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Cellularity_Estimates.tiff'),
##D     x = cor.data,
##D     main = 'Correlation matrix',
##D     xaxis.lab = NULL,
##D     yaxis.lab = NULL,
##D     cell.text = y,
##D     clustering.method = 'ward',
##D     plot.dendrograms = 'none',
##D     rows.distance.method = 'correlation',
##D     cols.distance.method = 'correlation',
##D     cor.method = 'pearson',
##D     col.pos = which(y != '1', arr.ind = TRUE)[,1],
##D     row.pos = which(y != '1', arr.ind = TRUE)[,2],
##D     text.fontface = 2,
##D     text.col = 'white',
##D     text.cex = 0.70,
##D     colourkey.cex = 1,
##D     colour.scheme = c('blue', 'darkgrey', 'brown'),
##D     colour.centering.value = 0,
##D     at = seq(-1, 1, 0.001),
##D     colour.alpha = 1.5,
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Discrete sequential colours
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Discrete_Colours_Sequential.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Discrete colours',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     # Adjusting total colours plotted
##D     colourkey.labels.at = seq(2,12,1),
##D     at = seq(2,12,1),
##D     # Add one to account for a 'null' colour
##D     total.colours = 11,
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Discrete qualitative colours
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Discrete_Colours_Qualitative.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Discrete colours',
##D     xlab.label = 'Genes',
##D     ylab.label = 'Samples',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     # Adjusting total colours plotted
##D     colourkey.labels.at = seq(2,12,1),
##D     colourkey.labels = seq(2,12,1),
##D     at = seq(2,12,1),
##D     # Add one to account for a 'null' colour
##D     total.colours = 11,
##D     colour.scheme = default.colours(10),
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_Nature_style.tiff'),
##D     x = microarray[1:20, 1:20],
##D     main = 'Nature style',
##D     xaxis.lab = NA,
##D     yaxis.lab = 1:20,
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     colourkey.cex = 1,
##D     # Adjusting total colours plotted
##D     colourkey.labels.at = seq(2,12,1),
##D     colourkey.labels = seq(2,12,1),
##D     at = seq(2,12,1),
##D     # Add one to account for a 'null' colour
##D     total.colours = 11,
##D     colour.scheme = default.colours(10),
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
##D     description = 'Heatmap created using BoutrosLab.plotting.general'
##D     );    
##D 
##D # create heatmap with key like legend - used to show range of continuous variables
##D 
##D # First create legend with discrete colours 
##D sex.colour <- recode.vector(
##D     patient$sex,
##D     list(
##D         dodgerblue = 'male',
##D         pink = 'female'
##D         )
##D     );
##D 
##D stage.colour <- recode.vector(
##D     patient$stage,
##D     list(
##D         plum1 = 'I',
##D         orchid1 = 'II',
##D         orchid3 = 'III',
##D         orchid4 = 'IV'
##D         )
##D     );
##D 
##D msi.colour <- recode.vector(
##D     patient$msi,
##D     list(
##D         chartreuse4 = 'MSS',
##D         chartreuse2 = 'MSI-High'
##D         )
##D     );
##D 
##D discrete.covariate <- list(
##D     rect = list(
##D         col = 'transparent',
##D         fill = sex.colour,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'transparent',
##D         fill = stage.colour,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'transparent',
##D         fill = msi.colour,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D discrete.covariate.legend <- list(
##D     legend = list(
##D         colours = c('dodgerblue', 'pink'),
##D         labels = c('male','female'),
##D         title = expression(underline('Sex'))
##D         ),
##D     legend = list(
##D         colours = c('plum1', 'orchid1', 'orchid3', 'orchid4'),
##D         labels = c('I','II', 'III', 'IV'),
##D         title = expression(underline('Stage'))
##D         ),
##D     legend = list(
##D         colours = c('chartreuse4', 'chartreuse2'),
##D         labels = c('MSS','MSI-High'),
##D         title = expression(underline('MSI'))
##D         ),
##D     legend = list(
##D         colours = c('grey0', 'grey100'),
##D         labels = c('want key like','legend here'),
##D         title = expression(underline('one')),
##D 	continuous = TRUE,
##D 	height=3
##D         ),
##D     legend = list(
##D         colours = c('grey0', 'grey100'),
##D         labels = c('want key like','legend here'),
##D         title = expression(underline('two'))
##D         ),
##D     legend = list(
##D         colours = c('grey0', 'grey100'),
##D         labels = c(0,10),
##D         title = expression(underline('three')),
##D 	continuous = TRUE,
##D         width = 3,
##D         tck = 1,
##D         tck.number = 3,
##D         at = c(0,100),
##D 	angle = -90,
##D 	just = c("center","bottom")
##D         )
##D    );
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_ContinuousVariablesKey.tiff'),
##D     x = patient[1:20, 4:6],
##D     xlab.label = 'Samples',
##D     ylab.label = 'Scaled Data',
##D     xaxis.cex = 0.75,
##D     yaxis.cex = 0.75,
##D     clustering.method = 'none',
##D     print.colour.key = FALSE,
##D     scale=TRUE,
##D     same.as.matrix = FALSE,
##D     covariates.top = discrete.covariate,
##D     covariates.top.grid.row = list(lwd = 1),
##D     covariate.legends = discrete.covariate.legend,
##D     legend.title.just = 'left',
##D     colour.scheme = c('gray0','grey100'),
##D     fill.colour = 'grey95',
##D     axis.xlab.padding = 1.5
##D     );
##D 
##D 
##D 
##D 
##D create.heatmap(
##D     filename = paste0(tempdir(),'/Heatmap_borderRemoved.tiff'),
##D     x = simple.data,
##D     main = 'Simple',
##D     description = 'Heatmap created using BoutrosLab.plotting.general',
##D     axes.lwd = 0
##D     );
## End(Not run)



