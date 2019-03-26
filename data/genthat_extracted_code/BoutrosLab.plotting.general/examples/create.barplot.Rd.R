library(BoutrosLab.plotting.general)


### Name: create.barplot
### Title: Make a barplot
### Aliases: create.barplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     x = sample(1:15, 10),
##D     y = LETTERS[1:10]
##D     );
##D 
##D # Simple example
##D create.barplot(
##D     filename = paste0(tempdir(), '/Barplot_Simple.tiff'),
##D     formula = x ~ y,
##D     data = simple.data,
##D     yat = seq(0,16,2)
##D     );
##D 
##D # set up the data
##D total.counts <- apply(SNV[1:15], 2, function(x){ mutation.count <- (30 - sum(is.na(x)))});
##D count.nonsyn <- function(x){
##D     mutation.count <- length(which(x == 1));
##D     }
##D nonsynonymous.SNV <- apply(SNV[1:15], 2, count.nonsyn);
##D other.mutations <- total.counts - nonsynonymous.SNV;
##D 
##D # subset the first fifteen samples
##D barplot.data <- data.frame(
##D     samples = rep(1:15, 2),
##D     mutation = c(rep('nonsynonymous', 15), rep('other',15)),
##D     values = c(nonsynonymous.SNV, other.mutations),
##D     sex = rep(patient$sex[1:15], 2),
##D     stage = rep(patient$stage[1:15], 2),
##D     msi = rep(patient$msi[1:15], 2)
##D     );
##D 
##D # Minimal input
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Minimal_Input.tiff'),
##D     formula = values ~ samples ,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Minimal input',
##D     # Editing the metadata
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes labels & limits
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Custom_Axes.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Axes labels & limits',
##D     # Setting axes labels
##D     xlab.lab = 'Sample',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     # Setting y-axis limits and tick-mark locations
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Font size and font face
##D create.barplot(
##D     filename = paste0(tempdir(), '/Barplot_Font_Changes.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Font changes',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     # Changing font sizes
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # Changing font type
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Sorting data
##D create.barplot(
##D     filename = paste0(tempdir(), '/Barplot_Sorted.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Sorted bars',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Order bars either by 'increasing' or 'decreasing'
##D     sample.order = 'decreasing',
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour changes
##D sex.colours <- replace(as.vector(barplot.data$sex), which(barplot.data$sex == 'male'),'dodgerblue');
##D sex.colours <- replace(sex.colours, which(barplot.data$sex == 'female'), 'pink');
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Colour_Changes.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Colour changes',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Colour bars based on sex
##D     col = sex.colours,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Legend
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Legend.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Legend',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     col = sex.colours,
##D     # Adding legend to explain bar colour-coding
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 3,
##D                         fill = c('dodgerblue', 'pink')
##D                         ),
##D                     text = list(
##D                         lab = c('Male','Female')
##D                         ),
##D                     padding.text = 5,
##D                     cex = 1
##D                     )
##D                 ),
##D                 # Positioning legend on plot
##D                 x = 0.75,
##D                 y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D 
##D # Grouped barplot
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Grouped.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data,
##D     main = 'Grouped bar chart',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Setting groups
##D     groups = mutation,
##D     col = default.colours(12, is.greyscale = FALSE)[11:12],
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 2,
##D                         fill = default.colours(12, is.greyscale = FALSE)[11:12]
##D                         ),  
##D                     text = list(
##D                         lab = c('Nonsynonymous SNV','Other SNV')
##D                         ),
##D                     padding.text = 3,
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.55,
##D             y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Grouped labels
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Grouped_Labels.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data,
##D     main = 'Grouped labels',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Setting groups
##D     groups = mutation,
##D     col = default.colours(12, is.greyscale = FALSE)[11:12],
##D     # Grouped labels
##D     xaxis.lab = rep(c('nonsynonymous', 'other'), 15),
##D     xaxis.rot = 90,
##D     group.labels = TRUE,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Stacked barplot
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Stacked.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data,
##D     main = 'Stacked bar chart',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     groups = mutation,
##D     col = default.colours(12, is.greyscale = FALSE)[11:12],
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 2,
##D                         # reverse order to match stacked bar order
##D                         fill = rev(default.colours(12, is.greyscale = FALSE)[11:12])
##D                         ),
##D                     text = list(
##D                         # reverse order to match stacked bar order
##D                         lab = rev(c('Nonsynonymous SNV','Other SNV'))
##D                         ),
##D                     padding.text = 3,
##D                     cex = 1
##D                     )
##D                 ),
##D             x = 0.55,
##D             y = 0.95
##D             )
##D         ),
##D     # Changing the plot from a grouped plot to a stacked plot
##D     stack = TRUE,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Panel organization
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Panel_Layout.tiff'),
##D     # Setting the panel layout
##D     formula = values ~ samples | mutation,
##D     data = barplot.data,
##D     main = 'Panel layout',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Panel organization 2
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Panel_Layout_2.tiff'),
##D     formula = values ~ samples | mutation,
##D     data = barplot.data,
##D     main = 'Panel layout',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Adjusting the panel layout
##D     layout = c(1,2),
##D     y.spacing = 1,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Covariates
##D # Note: Covariates can also be created using the create.multiplot function
##D 
##D # set covariate colour schemes
##D covariate.colours.sex <- as.character(barplot.data$sex);
##D covariate.colours.sex[covariate.colours.sex == 'male'] <- 'dodgerblue';
##D covariate.colours.sex[covariate.colours.sex == 'female'] <- 'pink';
##D 
##D covariate.colours.stage <- as.character(barplot.data$stage);
##D covariate.colours.stage[covariate.colours.stage == 'I'] <- 'plum1';
##D covariate.colours.stage[covariate.colours.stage == 'II'] <- 'orchid1';
##D covariate.colours.stage[covariate.colours.stage == 'III'] <- 'orchid3';
##D covariate.colours.stage[covariate.colours.stage == 'IV'] <- 'orchid4';
##D 
##D covariate.colours.msi <- as.character(barplot.data$msi);
##D covariate.colours.msi[covariate.colours.msi == 'MSS'] <- 'chartreuse4';
##D covariate.colours.msi[covariate.colours.msi == 'MSI-High'] <- 'chartreuse2';
##D 
##D # create object to draw covariates
##D covariates.object <- list(
##D     rect = list(
##D         col = 'white',
##D         fill = covariate.colours.sex,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'white',
##D         fill = covariate.colours.stage,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'white',
##D         fill = covariate.colours.msi,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D # see BoutrosLab.plotting.general::covariates.grob() for more information
##D covariate.object.grob <- covariates.grob(
##D     covariates = covariates.object,
##D     ord = c(1:15),
##D     side = 'top',
##D     size = 0.8
##D     );
##D 
##D # Create legend to explain covariates
##D covariates.legends <- list(
##D     legend = list(
##D         colours = c('dodgerblue','pink'),
##D         labels = c('male','female'),
##D         title = 'Sex',
##D         border = 'white'
##D         ),
##D     legend = list(
##D         colours = c('plum1', 'orchid1', 'orchid3', 'orchid4'),
##D         labels = c('I','II','III','IV'),
##D         title = 'Stage',
##D         border = 'white'
##D         ),
##D     legend = list(
##D         colours = c('chartreuse4','chartreuse2'),
##D         labels = c('MSS','MSI-High'),
##D         title = 'MSI',
##D         border = 'white'
##D         )
##D     );
##D 
##D # see BoutrosLab.plotting.general::legend.grob() for more information 
##D covariate.legend.grob <- legend.grob(
##D     legends = covariates.legends,
##D     title.just = 'left'
##D     );
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Covariates.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Covariates',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     yaxis.fontface = 1,
##D     # removing x-axis formatting to give space to covariates
##D     xaxis.tck = 0,
##D     xaxis.lab = rep('',15),
##D     xaxis.cex = 0,
##D     # covariates
##D     legend = list(
##D         bottom = list(fun = covariate.object.grob),
##D         right = list(fun = covariate.legend.grob)
##D         ),
##D     key = list(
##D         x = 1,
##D         y = -0.028,
##D         text = list(
##D             lab = c('Sex','Stage','MSI')
##D             ),
##D         padding.text = 1
##D         ),
##D     bottom.padding = 4,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Auto_legend.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Covariates',
##D     ylab.lab = 'Mutations',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     yaxis.fontface = 1,
##D     # removing x-axis formatting to give space to covariates
##D     xaxis.tck = 0,
##D     xaxis.lab = rep('',15),
##D     xaxis.cex = 0,
##D     # covariates
##D     legend = list(
##D         inside = list(fun = covariate.legend.grob)
##D         ),
##D     bottom.padding = 4,
##D     inside.legend.auto = TRUE,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D # Horizontal orientation
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Horizontal.tiff'),
##D     # switch formula order
##D     formula = samples ~ values,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Plot horizontally',
##D     # Adjusting the panel layout
##D     plot.horizontal = TRUE,
##D     # covariates
##D     legend = list(
##D         inside = list(fun = covariate.legend.grob)
##D         ),
##D     inside.legend.auto = TRUE,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Change bar thickness and add text labels
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Text_Labels.tiff'),
##D     # switch formula order
##D     formula = samples ~ values,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Text labels and thin bars',
##D     # Adjusting the panel layout
##D     plot.horizontal = TRUE,
##D     box.ratio = 0.6,
##D     add.text = TRUE,
##D     text.x = 27.75,
##D     text.y = 1:15,
##D     text.labels = barplot.data[barplot.data$mutation == 'nonsynonymous','values'],
##D     text.cex = 0.8,
##D     text.fontface = 'italic',
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Error bars
##D error.data <- data.frame(
##D     genes = rownames(microarray)[1:15],
##D     values = apply(microarray[1:15,1:58], 1, mean),
##D     error = apply(microarray[1:15,1:58], 1, sd)
##D     );
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Error_Bars.tiff'),
##D     # needs sequential x-axis
##D     formula = values ~ 1:15,
##D     data = error.data,
##D     y.error.up = error.data$error,
##D     xaxis.lab = error.data$genes,
##D     main = 'Error bars',
##D     xlab.lab = 'Gene',
##D     ylab.lab = 'Change in Expression',
##D     ylimits = c(0,14),
##D     yat = seq(0,14,2),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.rot = 45,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Error_Bars_Horizontal.tiff'),
##D     # needs sequential x-axis
##D     formula = values ~ 1:15,
##D     data = error.data,
##D     y.error.up = error.data$error,
##D     yaxis.lab = error.data$genes,
##D     plot.horizontal = TRUE,
##D     main = 'Error bars',
##D     xlab.lab = 'Gene',
##D     ylab.lab = 'Change in Expression',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.rot = 45,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Grid lines
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Gridlines.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Gridlines',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Grid lines
##D     add.grid = TRUE,
##D     xgrid.at = seq(0,15,2),
##D 	col = sex.colours,
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 3,
##D                         fill = c('dodgerblue', 'pink')
##D                         ),
##D                     text = list(
##D                         lab = c('Male','Female')
##D                         ),
##D                     padding.text = 5,
##D                     cex = 1
##D                     )
##D                 ),
##D                 # Positioning legend on plot
##D                 x = 0.75,
##D                 y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Grid lines 2
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Gridlines_GreyBG.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Gridlines & grey background',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Grid lines
##D     background.col = 'grey85',
##D     add.grid = TRUE,
##D     xgrid.at = seq(0,15,2),
##D     col = sex.colours,
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 3,
##D                         fill = c('dodgerblue', 'pink')
##D                         ),
##D                     text = list(
##D                         lab = c('Male','Female')
##D                         ),
##D                     padding.text = 5,
##D                     cex = 1
##D                     )
##D                 ),
##D                 # Positioning legend on plot
##D                 x = 0.75,
##D                 y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Labels
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Labels.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Labels',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Labels
##D     text.above.bars = list(
##D         labels = c('*','27','15','*'), 
##D         padding = 0.75, 
##D         bar.locations = c(1, 3, 12, 14), 
##D         rotation = 0
##D         ),
##D     col = sex.colours,
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 3,
##D                         fill = c('dodgerblue', 'pink')
##D                         ),
##D                     text = list(
##D                         lab = c('Male','Female')
##D                         ),
##D                     padding.text = 5,
##D                     cex = 1
##D                     )
##D                 ),
##D                 # Positioning legend on plot
##D                 x = 0.75,
##D                 y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # lines
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Lines.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Lines',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # Lines
##D     sample.order = 'increasing',
##D     line.func = function(x) {0.1*x**2},
##D     line.from = 0,
##D     line.to = 16,
##D     line.col = 'darkgrey',
##D     abline.h = 10,
##D     abline.col = 'red',
##D     col = sex.colours,
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 3,
##D                         fill = c('dodgerblue', 'pink')
##D                         ),
##D                     text = list(
##D                         lab = c('Male','Female')
##D                         ),
##D                     padding.text = 5,
##D                     cex = 1
##D                     )
##D                 ),
##D                 # Positioning legend on plot
##D                 x = 0.75,
##D                 y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Background rectangle
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Bg_Rectangle.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Background rectangle',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     sample.order = 'increasing',
##D     # Background rectangle
##D     add.rectangle = TRUE,
##D     xleft.rectangle = seq(0.5, 14.5, 2),
##D     ybottom.rectangle = 0,
##D     xright.rectangle = seq(1.5, 15.5, 2),
##D     ytop.rectangle = 30,
##D     col.rectangle = 'lightgrey',
##D     col = sex.colours,
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         col = 'black',
##D                         pch = 22,
##D                         cex = 3,
##D                         fill = c('dodgerblue', 'pink')
##D                         ),
##D                     text = list(
##D                         lab = c('Male','Female')
##D                         ),
##D                     padding.text = 5,
##D                     cex = 1
##D                     )
##D                 ),
##D                 # Positioning legend on plot
##D                 x = 0.75,
##D                 y = 0.95
##D             )
##D         ),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Raster
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_with_raster.tiff'),
##D     formula = values ~ samples,
##D     data = barplot.data[barplot.data$mutation == 'nonsynonymous',],
##D     main = 'Raster fill',
##D     xlab.lab = 'Samples',
##D     ylab.lab = 'Nonsynonymous SNVs',
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     # filling bars with raster
##D     raster = 1:10/10,
##D     raster.just = 'bottom',
##D     description = 'Description of image here'
##D     );
##D 
##D # Nature format
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_Nature_style.tiff'),
##D     formula = x ~ y,
##D     data = simple.data,
##D     yat = seq(0,16,2),
##D     main = 'Nature style',
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
##D # Left Justified Example
##D create.barplot(
##D     filename = paste0(tempdir(),'/Barplot_TwoTopLabelsLeftJustified.tiff'),
##D     formula = x ~ y,
##D     data = simple.data,
##D     yat = seq(0,16,2),
##D     ylab.label = NULL,
##D     # set top label details
##D     xlab.top.label = 'Sample Label',
##D     xlab.top.cex = 1.5,
##D     xlab.top.x = -0.125,
##D     xlab.top.y = 0.5,
##D     xlab.top.just = 'left',
##D     # set main label details
##D     main = 'Sample Main',
##D     main.just = 'left',
##D     main.x = 0,
##D     main.y = 0.6,
##D     top.padding = 1
##D     );
##D 
## End(Not run)



