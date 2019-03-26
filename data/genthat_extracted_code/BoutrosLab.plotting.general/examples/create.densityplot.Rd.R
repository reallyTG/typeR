library(BoutrosLab.plotting.general)


### Name: create.densityplot
### Title: Make a density plot
### Aliases: create.densityplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     x = rnorm(1000),
##D     y = rnorm(1000, mean = 3, sd = 3)
##D     );
##D 
##D create.densityplot(
##D     filename = paste0(tempdir(), '/Densityplot_Simple.tiff'),
##D     x = simple.data,
##D     main = 'Simple',
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # format data
##D format.data <- microarray[1:3,1:58];
##D format.data <- as.data.frame(t(format.data));
##D 
##D # Minimal Input
##D create.densityplot(
##D     filename = paste0(tempdir(),'/Densityplot_Minimal_Input.tiff'),
##D     x = format.data,
##D     main = 'Minimal input',
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Line type
##D create.densityplot(
##D     filename = paste0(tempdir(),'/Densityplot_Line_Type.tiff'),
##D     x = format.data,
##D     main = 'Line type',
##D     # Line type
##D     lty = c('solid','dashed','dotted'),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.densityplot(
##D     filename = paste0(tempdir(),'/Densityplot_Axes_Labels.tiff'),
##D     x = format.data,
##D     main = 'Axes & labels',
##D     lty = c('solid','dashed','dotted'),
##D     # Axes & Labels
##D     ylimits = c(-0.1, 2.5),
##D     ylab.cex = 1.5,
##D     xat = seq(0, 13, 1),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour change & Legend
##D create.densityplot(
##D     filename = paste0(tempdir(), '/Densityplot_Colour_Legend.tiff'),
##D     x = format.data,
##D     main = 'Colour & legend',
##D     lty = c('solid','dashed','dotted'),
##D     ylimits = c(-0.1, 2.5),
##D     ylab.cex = 1.5,
##D     # Colours
##D     col = default.colours(3),
##D     # Legend
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 21,
##D                         cex = 1.5,
##D                         fill = default.colours(3)
##D                         ),
##D                     text = list(
##D                         lab = colnames(format.data)
##D                         ),
##D                     padding.text = c(0,5,0),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.65,
##D             y = 0.97,
##D             draw = FALSE
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Correlation key
##D create.densityplot(
##D     filename = paste0(tempdir(), '/Densityplot_Correlation_Key.tiff'),
##D     x = format.data[,1:2],
##D     main = 'Correlation key',
##D     lty = c('solid','dotted'),
##D     ylimits = c(-0.1, 2.5),
##D     ylab.cex = 1.5,
##D     col = default.colours(2),
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(2),
##D                         pch = 21,
##D                         cex = 1.5,
##D                         fill = default.colours(2)
##D                         ),
##D                     text = list(
##D                         lab = colnames(format.data)[1:2]
##D                         ),
##D                     padding.text = c(0,5,0),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.65,
##D             y = 0.97,
##D             draw = FALSE
##D             ),
##D         # Correlation key accepts two vectors
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = get.corr.key(
##D                     x = as.numeric(format.data[,1]),
##D                     y = as.numeric(format.data[,2]),
##D                     label.items = c('pearson','beta1'),
##D                     alpha.background = 1,
##D                     key.cex = 1.2
##D                     )
##D                 ),
##D             x = 0.65,
##D             y = 0.85,
##D             corner = c(0,1)
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Gridlines
##D create.densityplot(
##D     filename = paste0(tempdir(), '/Densityplot_Gridlines_1.tiff'),
##D     x = format.data,
##D     main = 'Gridlines',
##D     lty = c('solid','dashed','dotted'),
##D     ylimits = c(-0.1, 2.5),
##D     ylab.cex = 1.5,
##D     col = default.colours(3),
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 21,
##D                         cex = 1.5,
##D                         fill = default.colours(3)
##D                         ),
##D                     text = list(
##D                         lab = colnames(format.data)
##D                         ),
##D                     padding.text = c(0,5,0),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.65,
##D             y = 0.97,
##D             draw = FALSE
##D             )
##D         ),
##D     # Grid lines
##D     type = c('l','g'),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Gridlines
##D create.densityplot(
##D     filename = paste0(tempdir(),'/Densityplot_Gridlines_2.tiff'),
##D     x = format.data,
##D     main = 'Gridlines',
##D     lty = c('solid','dashed','dotted'),
##D     ylimits = c(-0.1, 2.5),
##D     ylab.cex = 1.5,
##D     col = default.colours(3),
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 21,
##D                         cex = 1.5,
##D                         fill = default.colours(3)
##D                         ),
##D                     text = list(
##D                         lab = colnames(format.data)
##D                         ),
##D                     padding.text = c(0,5,0),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.65,
##D             y = 0.97,
##D             draw = FALSE
##D             )
##D         ),
##D     # Grid lines
##D     type = c('l','g'),
##D     xgrid.at = seq(0,14,1),
##D     ygrid.at = seq(0,2.5,0.25),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.densityplot(
##D     filename = paste0(tempdir(),'/Densityplot_Nature_style.tiff'),
##D     x = format.data,
##D     main = 'Nature style',
##D     lty = c('solid','dashed','dotted'),
##D     ylimits = c(-0.1, 2.5),
##D     ylab.cex = 1.5,
##D     xlab.cex = 1.5,
##D     col = default.colours(3),
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = default.colours(3),
##D                         pch = 21,
##D                         cex = 1.5,
##D                         fill = default.colours(3)
##D                         ),
##D                     text = list(
##D                         lab = colnames(format.data)
##D                         ),
##D                     padding.text = c(0,5,0),
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.65,
##D             y = 0.97,
##D             draw = FALSE
##D             )
##D         ),
##D     # Grid lines
##D     style = 'Nature',
##D 
##D     # demonstrating how to italicize character variables
##D     ylab.lab = expression(paste('italicized ', italic('a'))),
##D   
##D     # demonstrating how to create en-dashes
##D     xlab.lab = expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3))
##D     );
## End(Not run)



