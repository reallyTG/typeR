library(BoutrosLab.plotting.general)


### Name: create.dotmap
### Title: Make a dotmap with coloured background
### Aliases: create.dotmap
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D simple.data <- data.frame(
##D     'A' = runif(n = 15, min = -1, max = 1),
##D     'B' = runif(n = 15, min = -1, max = 1),
##D     'C' = runif(n = 15, min = -1, max = 1),
##D     'D' = runif(n = 15, min = -1, max = 1),
##D     'E' = runif(n = 15, min = -1, max = 1)
##D     );
##D 
##D create.dotmap(
##D     filename = paste0(tempdir(),'Dotmap_Simple.tiff'),
##D     x = simple.data,
##D     main = 'Simple',
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # create a function to determine the spot sizes (default function works best with values < 1)
##D spot.size.med <- function(x) {abs(x)/3;}
##D 
##D # Minimal Input
##D create.dotmap(
##D     filename = paste0(tempdir(),'Dotmap_Minimal_Input.tiff'),
##D     x = microarray[1:5,1:5],
##D     main = 'Minimal input',
##D     spot.size.function = spot.size.med,
##D     xaxis.rot = 90,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D spot.size.small <- function(x) {abs(x)/5;}
##D 
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_Axes_Labels.tiff'),
##D     x = microarray[1:15,1:15],
##D     main = 'Axes & labels',
##D     spot.size.function = spot.size.small,
##D     # Adjusting the font sizes and labels
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Legend
##D key.sizes <- seq(2,12,2);
##D 
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_Legend.tiff'),
##D     x = microarray[1:15,1:15],
##D     main = 'Legend',
##D     spot.size.function = spot.size.small,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     # Legend for dots
##D     key = list(
##D         space = 'right',
##D         points = list(
##D             cex = spot.size.small(key.sizes),
##D             col = default.colours(2, palette.type = 'dotmap')[2],
##D             pch = 19
##D             ),
##D         text = list(
##D             lab = as.character(key.sizes),
##D             cex = 1,
##D             adj = 1
##D             ),
##D         padding.text = 3,
##D         background = 'white'
##D         ),
##D     key.top = 1,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Cluster by dots and add dendrogram
##D plot.data <- microarray[1:15,1:15];
##D 
##D # cluster data
##D clustered.data <- diana(plot.data);
##D 
##D # order data by cluster
##D plot.data <- plot.data[clustered.data$order,];
##D 
##D # create dendogram
##D dendrogram.data <- create.dendrogram(x = plot.data, clustering.method = 'diana',
##D 	cluster.dimension = 'row');
##D 
##D dendrogram.grob <- latticeExtra::dendrogramGrob(
##D         x = dendrogram.data,
##D         side = 'right',
##D         type = 'rectangle'
##D         );
##D 
##D # create dotmap
##D create.dotmap(
##D     x = plot.data,
##D     filename = paste0(tempdir(),'/Dotmap_clustered_dendrogram.tiff'),
##D     main = 'Clustered & dendrogram',
##D     spot.size.function = spot.size.small,
##D     # Adjusting the font sizes and labels
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     legend = list(
##D         right = list(fun = dendrogram.grob)
##D         ),
##D     right.padding = 4,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Add background data
##D key.sizes <- c(-1, 1);
##D 
##D CNA.colour.function <- function(x){
##D     colours <- rep('white', length(x));
##D     colours[sign(x) == 1] <- 'Red';
##D     colours[sign(x) == -1] <- 'Blue';
##D     colours[x == 0] <- 'transparent';
##D     return(colours);
##D     }
##D 
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_with_Background.tiff'),
##D     # added new data for the dots
##D     x = CNA[1:15,1:15],
##D     # Moving the dot-data to be background data
##D     bg.data = microarray[1:15,1:15],
##D     colour.scheme = c('white','black'),
##D     main = 'Background',
##D     spot.size.function = 1,
##D     spot.colour.function = CNA.colour.function,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     key = list(
##D         space = 'right',
##D         points = list(
##D             cex = 1,
##D             col = CNA.colour.function(key.sizes),
##D             pch = 19
##D             ),
##D         text = list(
##D             lab = c('Gain', 'Loss'),
##D             cex = 1,
##D             adj = 1
##D             ),
##D         title = 'CNA',
##D         padding.text = 2,
##D         background = 'white'
##D         ),
##D     # Adding colourkey for background data
##D     colourkey = TRUE,
##D     key.top = 1,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Discrete background colours
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_Discrete_Background.tiff'),
##D     x = CNA[1:15,1:15],
##D     bg.data = microarray[1:15,1:15],
##D     main = 'Discrete background',
##D     spot.size.function = 1,
##D     spot.colour.function = CNA.colour.function,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     key = list(
##D         space = 'right',
##D         points = list(
##D             cex = 1,
##D             col = CNA.colour.function(key.sizes),
##D             pch = 19
##D             ),
##D         text = list(
##D             lab = c('Gain', 'Loss'),
##D             cex = 1,
##D             adj = 1
##D             ),
##D         title = 'CNA',
##D         padding.text = 2,
##D         background = 'white'
##D         ),
##D     colourkey = TRUE,
##D     key.top = 1,
##D     # Changing background colour scheme
##D     colour.scheme = c('lightyellow','gold','darkorange', 'darkorange3'),
##D     at = seq(0,12,3),
##D     colourkey.labels = seq(0,12,3),
##D     colourkey.labels.at = seq(0,12,3),
##D     bg.alpha = 0.65,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Dot outlines
##D border.colours <- function(x){
##D     colours <- rep('transparent', length(x));
##D     colours[x > 0] <- 'black';
##D     colours[x == 0] <- 'transparent';
##D     return(colours);
##D     }
##D 
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_Outlined_Dots.tiff'),
##D     x = CNA[1:15,1:15],
##D     bg.data = microarray[1:15,1:15],
##D     main = 'Dot outlines',
##D     spot.size.function = 1,
##D     spot.colour.function = CNA.colour.function,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     key = list(
##D         space = 'right',
##D         points = list(
##D             cex = 1,
##D             col = 'black',
##D             # Remember to also change the pch in the legend
##D             pch = 21,
##D             fill = CNA.colour.function(key.sizes)
##D             ),
##D         text = list(
##D             lab = c('Gain', 'Loss'),
##D             cex = 1,
##D             adj = 1
##D             ),
##D         title = 'CNA',
##D         padding.text = 2,
##D         background = 'white'
##D         ),
##D     colourkey = TRUE,
##D     key.top = 1,
##D     colour.scheme = c('lightyellow','gold','darkorange', 'darkorange3'),
##D     at = seq(0,12,3),
##D     colourkey.labels = seq(0,12,3),
##D     colourkey.labels.at = seq(0,12,3),
##D     bg.alpha = 0.65,
##D     # Change the plotting character to one which has an outline
##D     pch = 21,
##D     pch.border.col = border.colours(CNA[1:15,1:15]),
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Covariates & Legend
##D sex.colours <- patient$sex[1:15];
##D sex.colours[sex.colours == 'male'] <- 'dodgerblue';
##D sex.colours[sex.colours == 'female'] <- 'pink';
##D 
##D sample.covariate <- list(
##D     rect = list(
##D         col = 'black',
##D         fill = sex.colours,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D cov.grob <- covariates.grob(
##D     covariates = sample.covariate,
##D     ord = c(1:15),
##D     side = 'top'
##D     );
##D 
##D sample.cov.legend <- list(
##D     legend = list(
##D         colours = c('dodgerblue', 'pink'),
##D         labels = c('male','female'),
##D         title = 'Sex'
##D         )
##D     );
##D 
##D cov.legend <- legend.grob(
##D     legends = sample.cov.legend
##D     );
##D 
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_Covariates.tiff'),
##D     x = CNA[1:15,1:15],
##D     bg.data = microarray[1:15,1:15],
##D     main = 'Covariates',
##D     spot.size.function = 1,
##D     spot.colour.function = CNA.colour.function,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     key = list(
##D         space = 'right',
##D         points = list(
##D             cex = 1,
##D             col = 'black',
##D             pch = 21,
##D             fill = CNA.colour.function(key.sizes)
##D             ),
##D         text = list(
##D             lab = c('Gain', 'Loss'),
##D             cex = 1,
##D             adj = 1
##D             ),
##D         title = 'CNA',
##D         padding.text = 2,
##D         background = 'white'
##D         ),
##D     colourkey = TRUE,
##D     key.top = 1,
##D     colour.scheme = c('lightyellow','gold','darkorange', 'darkorange3'),
##D     at = seq(0,12,3),
##D     colourkey.labels = seq(0,12,3),
##D     colourkey.labels.at = seq(0,12,3),
##D     bg.alpha = 0.65,
##D     pch = 21,
##D     pch.border.col = border.colours(CNA[1:15,1:15]),
##D     # Insert covariates & legend
##D     legend = list(
##D         top = list(
##D             fun = cov.grob
##D             ),
##D         left = list( 
##D             fun = cov.legend
##D             )
##D         ),
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Side covariates with label
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
##D chr.cov.grob <- covariates.grob(
##D     covariates = chr.covariate,
##D     ord = c(1:15),
##D     side = 'right'
##D     );
##D 
##D # create dot legend
##D dot.grob <- draw.key(
##D     list(
##D         space = 'right',
##D          points = list(
##D                 cex = 1,
##D                 col = 'black',
##D                 pch = 21,
##D                 fill = CNA.colour.function(key.sizes)
##D                 ),
##D             text = list(
##D                 lab = c('Gain', 'Loss'),
##D                 cex = 1,
##D                 adj = 1
##D                 ),
##D             title = 'CNA',
##D             padding.text = 2,
##D             background = 'white'
##D         )
##D     );
##D 
##D # Setting up the layout for the joint legends
##D right.layout <- grid.layout(
##D     nrow = 1,
##D     ncol = 2,
##D     width = unit(
##D         x = c(0,1),
##D         units = rep('lines',2)
##D         ),
##D     heights = unit(
##D         x = c(1,1),
##D         units = rep('npc', 1)
##D         )
##D     );
##D 
##D right.grob <- frameGrob(layout = right.layout);
##D 
##D right.grob <- packGrob(
##D     frame = right.grob,
##D     grob = chr.cov.grob,
##D     row = 1,
##D     col = 1
##D     );
##D 
##D right.grob <- packGrob(
##D     frame = right.grob,
##D     grob = dot.grob,
##D     row = 1,
##D     col = 2
##D     );
##D 
##D temp <- create.dotmap(
##D     filename = paste0(tempdir(), '/Dotmap_Covariates_Side.tiff'),
##D     x = CNA[1:15,1:15],
##D     bg.data = microarray[1:15,1:15],
##D     main = 'Both covariates',
##D     spot.size.function = 1,
##D     spot.colour.function = CNA.colour.function,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.label = 'Sample',
##D     ylab.label = 'Gene',
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     colourkey = TRUE,
##D     key.top = 1,
##D     colour.scheme = c('lightyellow','gold','darkorange', 'darkorange3'),
##D     at = seq(0,12,3),
##D     colourkey.labels = seq(0,12,3),
##D     colourkey.labels.at = seq(0,12,3),
##D     bg.alpha = 0.65,
##D     pch = 21,
##D     pch.border.col = border.colours(CNA[1:15,1:15]),
##D     # insert covariates & legend
##D     legend = list(
##D         right = list(
##D             fun = right.grob
##D             )
##D         ),
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
##D 
##D # add side label to covariate
##D print(temp, position = c(0,0,1,1), more = TRUE);
##D 
##D draw.key(
##D     key = list(
##D         text = list(
##D             lab = 'Covariate Label',
##D             cex = 1,
##D             adj = 1
##D             )
##D         ),
##D     # position label on the plot
##D     vp = viewport(x = 0.86, y = 0.155, height = 1, width = 0.5, angle = 90),
##D     draw = TRUE
##D     );
##D 
##D dev.off();
##D 
##D # Nature style
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Dotmap_Nature_style.tiff'),
##D     x = CNA[1:15,1:15],
##D     bg.data = microarray[1:15,1:15],
##D     main = 'Nature style',
##D     spot.size.function = 1,
##D     spot.colour.function = CNA.colour.function,
##D     xaxis.cex = 0.8,
##D     yaxis.cex = 0.8,
##D     xaxis.lab = 1:15,
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     key = list(
##D         space = 'right',
##D         points = list(
##D             cex = 1,
##D             col = 'black',
##D             # Remember to also change the pch in the legend
##D             pch = 21,
##D             fill = CNA.colour.function(key.sizes)
##D             ),
##D         text = list(
##D             lab = c('Gain', 'Loss'),
##D             cex = 1,
##D             adj = 1
##D             ),
##D         title = 'CNA',
##D         padding.text = 2,
##D         background = 'white'
##D         ),
##D     colourkey = TRUE,
##D     key.top = 1,
##D     colour.scheme = c('lightyellow','gold','darkorange', 'darkorange3'),
##D     at = seq(0,12,3),
##D     colourkey.labels = seq(0,12,3),
##D     colourkey.labels.at = seq(0,12,3),
##D     bg.alpha = 0.65,
##D     # Change the plotting character to one which has an outline
##D     pch = 21,
##D     pch.border.col = border.colours(CNA[1:15,1:15]),
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
## End(Not run)



