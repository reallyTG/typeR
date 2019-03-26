library(BoutrosLab.plotting.general)


### Name: create.scatterplot
### Title: Make a scatterplot
### Aliases: create.scatterplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
##D simple.data <- data.frame(
##D     x = rnorm(800),
##D     y = rnorm(800)
##D     );
##D create.scatterplot(
##D     filename = paste0(tempdir(), '/Scatterplot_Simple.tiff'),
##D     formula = y ~ x,
##D     data = simple.data
##D     );
##D 
##D scatter.data <- data.frame(
##D     sample.one = microarray[1:800,1],
##D     sample.two = microarray[1:800,2],
##D     chr = microarray$Chr[1:800]
##D     );
##D 
##D # Minimal Input
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Minimal_Input.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Minimal Input',
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Axes & Labels
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Axes_Labels.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Axes & Labels',
##D     # Axes and labels
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Plotting space
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Plotting_Space.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Plotting Space',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     # change axes accordingly 
##D     xat = 2 ** (0:4),
##D     yat = seq(0, 16, 2),
##D     # change axes range accordingly
##D     xlimits = c(2 ** 0,16),
##D     ylimits = c(0, 15),
##D     # format labels
##D     xaxis.lab = c(
##D         expression('2'^'0'),
##D         expression('2'^'1'),
##D         expression('2'^'2'),
##D         expression('2'^'3'),
##D         expression('2'^'4')
##D         ),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # Transform the x-axis into log-2 space
##D     xaxis.log = 2,
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour & Plotting Character
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Colour_Pch.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Colour & Pch',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # setting the colour
##D     col = default.colours(2)[2],
##D     # setting the plotting character type & size
##D     pch = 21,
##D     cex = 1.5,
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour depth
##D # create colour scheme to illustrate adding a colourkey
##D chr.palette <- colour.gradient(default.colours(2)[2], 800);
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Colour_Depth.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Colour Depth',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     # setting the colour
##D     col = chr.palette,
##D     # setting the plotting character type & size
##D     pch = 19,
##D     cex = 1,
##D     # adding key for colours
##D     key.top = 1.5,
##D     legend = list(
##D         bottom = list(
##D             fun = draw.colorkey,
##D             args = list(
##D                 key = list(
##D                     col = chr.palette,
##D                     at = 1:800,
##D                     tick.number = 3,
##D                     space = 'bottom',
##D                     size = 1,
##D                     width = 1.25,
##D                     height = 1,
##D                     labels = list(
##D                         labels = 1:3,
##D                         cex = 1,
##D                         at = c(1, which(scatter.data$chr == 2)[1], which(scatter.data$chr == 3)[1])
##D                         )
##D                     )
##D                 )
##D             )
##D         ),
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Groups & Legend
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Groups_Legend.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Groups & Legend',
##D     # using arbitrary groups for the sake of illustration
##D     groups = scatter.data$chr,
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     col = default.colours(3),
##D     # Adding legend for groups
##D     key = list(
##D         text = list(
##D             lab = c('1','2','3'),
##D             cex = 1,
##D             col = 'black'
##D             ),
##D         points = list(
##D             pch = 19,
##D             col = default.colours(3),
##D             cex = 1
##D             ),
##D         x = 0.04,
##D         y = 0.95,
##D         padding.text = 2
##D         ),
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Correlation Key
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Correlation_Key.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Correlation Key',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     col = 'black',
##D     pch = 21,
##D     # Adding correlation key
##D     legend = list(
##D         inside = list(
##D             fun = draw.key,
##D             args = list(
##D                 key = get.corr.key(
##D                     x = scatter.data$sample.one,
##D                     y = scatter.data$sample.two,
##D                     label.items = c('spearman','spearman.p','kendall','beta1'),
##D                     alpha.background = 0,
##D                     key.cex = 1
##D                     )
##D                 ),
##D             x = 0.04,
##D             y = 0.95,
##D             corner = c(0,1)
##D             )
##D         ),
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Panel Organization
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Panel.tiff'),
##D     formula = sample.two ~ sample.one | chr,
##D     data = scatter.data,
##D     main = 'Panel',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 21,
##D     col = 'black',
##D     fill = 'transparent',
##D     # set up panel layout
##D     layout = c(1,3),
##D     yrelation = 'free',
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Covariates
##D cov.colours <- as.character(microarray$Chr[1:800]);
##D cov.colours[cov.colours == '1'] <- default.colours(3, palette.type = 'chromosomes')[1];
##D cov.colours[cov.colours == '2'] <- default.colours(3, palette.type = 'chromosomes')[2];
##D cov.colours[cov.colours == '3'] <- default.colours(3, palette.type = 'chromosomes')[3];
##D 
##D cov <- list(
##D     rect = list(
##D         col = 'transparent',
##D         fill = cov.colours
##D         )
##D     );
##D 
##D cov.grob <- covariates.grob(
##D     covariates = cov,
##D     ord = c(1:length(cov.colours)),
##D     side = 'top',
##D     size = 1
##D     );
##D 
##D cov.legend <- list(
##D     legend = list(
##D         colours = default.colours(3, palette.type = 'chromosomes'),
##D         labels = c('1', '2', '3'),
##D         title = 'Chromosome',
##D         border = 'transparent'
##D         )
##D     );
##D 
##D cov.legend.grob <- legend.grob(
##D     legends = cov.legend
##D     );
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Covariates.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Covariates',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 21,
##D     col = 'black',
##D     fill = 'transparent',
##D     # Adding covariate & legend
##D     legend = list(
##D         bottom = list(fun = cov.grob),
##D         right = list(fun = cov.legend.grob)
##D         ),
##D     # Ensuring sufficient spacing for covariate
##D     key.top = 3,
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Error bars
##D error.data <- data.frame(
##D     chr = (microarray$Start)[1:20],
##D     values = apply(microarray[1:20,1:58], 1, mean),
##D     error = apply(microarray[1:20,1:58], 1, sd)
##D     );
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Error_Bars.tiff'),
##D     formula = values ~ chr,
##D     data = error.data,
##D     main = 'Error Bars',
##D     xlab.label = 'Base pair location on chromosome one',
##D     ylab.label = 'Gene expression change',
##D     # xat = seq(0, 16, 2),
##D     yat = seq(0, 14, 2),
##D     # xlimits = c(0, 15),
##D     ylimits = c(0, 13),
##D     # Format xaxes
##D     xaxis.lab = c(
##D         scientific.notation(0, 1),
##D         scientific.notation(1000000, 1),
##D         scientific.notation(2000000, 1),
##D         scientific.notation(3000000, 1),
##D         scientific.notation(4000000, 1),
##D         scientific.notation(5000000, 1),
##D         scientific.notation(6000000, 1),
##D         scientific.notation(7000000, 1)
##D         ),
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 19,
##D     col = 'black',
##D     fill = 'transparent',
##D     # Specifying error bars
##D     error.bar.lwd = 1,
##D     error.whisker.angle = 120,
##D     y.error.up = error.data$error,
##D     y.error.bar.col = 'black',
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Error_Bars_MultiColor.tiff'),
##D     formula = values ~ chr,
##D     data = error.data,
##D     main = 'Error Bars',
##D     xlab.label = 'Base pair location on chromosome one',
##D     ylab.label = 'Gene expression change',
##D     # xat = seq(0, 16, 2),
##D     yat = seq(0, 14, 2),
##D     # xlimits = c(0, 15),
##D     ylimits = c(0, 13),
##D     # Format xaxes
##D     xaxis.lab = c(
##D         scientific.notation(0, 1),
##D         scientific.notation(1000000, 1),
##D         scientific.notation(2000000, 1),
##D         scientific.notation(3000000, 1),
##D         scientific.notation(4000000, 1),
##D         scientific.notation(5000000, 1),
##D         scientific.notation(6000000, 1),
##D         scientific.notation(7000000, 1)
##D         ),
##D     xaxis.rot = 90,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 19,
##D     col = 'black',
##D     fill = 'transparent',
##D     # Specifying error bars
##D     error.bar.lwd = 1,
##D     error.whisker.angle = 120,
##D     y.error.up = error.data$error,
##D     y.error.bar.col = c('black','red','blue'),
##D     description = 'Scatter plot created by BoutrosLab.plotting.general',
##D     group.specific.colouring = FALSE
##D     );
##D 
##D 
##D # Gridlines
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Gridlines.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Gridlines',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 21,
##D     col = 'black',
##D     fill = 'transparent',
##D     # Adding gridlines
##D     type = c('p','g'),
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # lines & background rectangle
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Lines_BG.tiff'),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Lines & BG rectangle',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 21,
##D     col = 'black',
##D     fill = 'transparent',
##D     type = c('p','g'),
##D     # add xy line
##D     add.xyline = TRUE,
##D     xyline.lty = 3,
##D     xyline.col = 'red',
##D     xyline.lwd = 3,
##D     # add background rectangle
##D     add.rectangle = TRUE,
##D     xleft.rectangle = which(scatter.data$chr == 2)[1]/800*15,
##D     xright.rectangle = which(scatter.data$chr == 3)[1]/800*15,
##D     ybottom.rectangle = 0,
##D     ytop.rectangle = 15,
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # attach lines to points
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Lines.tiff'),
##D     formula = sample.two ~ sample.one | chr,
##D     data = scatter.data,
##D     main = 'Lines',
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     xat = seq(0, 16, 2),
##D     yat = seq(0, 16, 2),
##D     xlimits = c(0, 15),
##D     ylimits = c(0, 15),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 21,
##D     col = 'black',
##D     fill = 'transparent',
##D     # attach lines
##D     type = c('h','p'),
##D     layout = c(1,3),
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # ROC curve
##D set.seed(123456);
##D 
##D class.values <- runif(50, 0, 1);
##D observed.values <- sample(c(0,1), size = 50, replace = TRUE);
##D cutoffs <- seq(1,0,-0.01);
##D tprs <- c();
##D fprs <- c();
##D 
##D for (c in cutoffs) {
##D         roc.classification <- rep(0, length(class.values));
##D         roc.classification[class.values >= c] <- 1;
##D         roc.results <- table(
##D                 factor(roc.classification, levels = c(0,1)),
##D                 factor(observed.values, levels = c(0,1)),
##D                 dnn = c('pred', 'obs')
##D                 );
##D         tprs <- c(tprs, roc.results[2,2] / (roc.results[2,2] + roc.results[1,2]));
##D         fprs <- c(fprs, roc.results[2,1] / (roc.results[2,1] + roc.results[1,1]));
##D         }
##D 
##D roc.data <- data.frame(cutoff = cutoffs, TPR = tprs, FPR = fprs);
##D points.x <- roc.data[match(c(0.25, 0.5, 0.75), roc.data$cutoff), 'FPR'];
##D points.y <- roc.data[match(c(0.25, 0.5, 0.75), roc.data$cutoff), 'TPR'];
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_ROC.tiff'),
##D     formula = TPR ~ FPR,
##D     data = roc.data,
##D     main = 'ROC',
##D     xlab.label = 'False positive rate',
##D     ylab.label = 'True positive rate',
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     type = 's',
##D     lwd = 3,
##D     add.xyline = TRUE,
##D     xyline.col = 'grey',
##D     add.points = TRUE,
##D     points.x = points.x,
##D     points.y = points.y,
##D     points.col = c('blue', 'darkgreen', 'red'),
##D     add.text = TRUE,
##D     text.labels = paste('cutoff = ', c(0.25, 0.5, 0.75), sep = ''),
##D     #text.x = points.x - 0.14,
##D     #text.y = points.y + 0.03,
##D     text.x = points.x,
##D     text.y = points.y,
##D     text.guess.labels = TRUE,
##D     text.guess.label.position = 155,
##D     text.guess.radius.factor = 2.5,
##D     description = 'Scatter plot created by BoutrosLab.plotting.general'
##D     );
##D 
##D # Volcano Plots
##D fold.change <- apply(microarray[,1:29], 1, mean) - apply(microarray[,30:58], 1, mean);
##D 
##D fake.microarray <- microarray[,1:58] - log(mean(apply(microarray[,1:58],1, mean)));
##D fake.microarray[,30:58] <-  fake.microarray[,30:58] + mean(fold.change);
##D fake.microarray[fake.microarray < 0] <- 0;
##D 
##D p.values <- apply(fake.microarray[,1:58], 1, function(x) {t.test(x=x[1:29],y=x[30:58])$p.value} );
##D fold.change <- apply(fake.microarray[, 1:29], 1, mean) - apply(fake.microarray[, 30:58], 1,mean);
##D p.values.adjusted <- p.adjust(p.values, 'fdr');
##D 
##D dot.colours <- vector(length=length(p.values));
##D dot.colours[p.values.adjusted < .05 & fold.change < 0] <- 'green';
##D dot.colours[p.values.adjusted < .05 & fold.change > 0] <- 'red';
##D dot.colours[p.values.adjusted > .05] <- 'black';
##D 
##D 
##D volcano.data <- data.frame(
##D     p.values = -log10(p.values.adjusted),
##D     fold.change = fold.change
##D     );
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Volcano_Plot.tiff'),
##D     formula = p.values ~ fold.change,
##D     data = volcano.data,
##D     col = dot.colours,
##D     alpha = .5,
##D     yat = c(0,2,4,6,8),
##D     ylimits = c(-0.1,8.1),
##D     yaxis.lab = expression(10^0,10^-2,10^-4,10^-6,10^-8),
##D     yaxis.cex = 1.5,
##D     xaxis.cex = 1.5,
##D     xlab.label = 'foldChange',
##D     ylab.label = 'pValues',
##D     xlab.cex = 1.75,
##D     ylab.cex = 1.75
##D     );
##D 
##D # Automatic Labeling
##D interesting.fold.change <- (fold.change < -.9 | fold.change > .9);
##D interesting.p.value <- (-log10(p.values.adjusted) < 8 & -log10(p.values.adjusted) > 2);
##D interesting.points <- interesting.fold.change & interesting.p.value;
##D 
##D text.x <- fold.change[interesting.points];
##D text.y <- (-log10(p.values.adjusted))[interesting.points];
##D text.labels <- rownames(microarray)[interesting.points];
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),'/Scatterplot_Volcano_Plot_With_Labels.tiff'),
##D     formula = p.values ~ fold.change,
##D     data = volcano.data,
##D     alpha = .5,
##D     yat = c(0,2,4,6,8),
##D     ylimits = c(-0.1,8.1),
##D     xlimits = c(-1.5,1.5),
##D     yaxis.lab = expression(10^0,10^-2,10^-4,10^-6,10^-8),
##D     yaxis.cex = 1.5,
##D     xaxis.cex = 1.5,
##D     xlab.label = 'foldChange',
##D     ylab.label = 'pValues',
##D     xlab.cex = 1.75,
##D     ylab.cex = 1.75,
##D     add.text = TRUE,
##D     text.x = text.x,
##D     text.y = text.y,
##D     text.labels = text.labels,
##D     text.guess.labels = TRUE
##D     );
##D 
##D # With line segments
##D line.data <- data.frame(
##D     group = c('A','B','C'),
##D     x = sample(1:10,3),
##D     y = sample(1:10,3),
##D     z = sample(1:10,3)
##D     );
##D 
##D create.scatterplot(
##D     (x+y+z) ~ group,
##D     line.data,
##D     filename = paste0(tempdir(),'/Scatterplot_with_LineSegments.tiff'),
##D     cex = 0,
##D     add.line.segments = TRUE,
##D     line.start = list(
##D 	rep(0,nrow(line.data)), 
##D 	line.data$x,
##D 	c(line.data$x + line.data$y)
##D 	),
##D     line.end = list(
##D 	line.data$x, 
##D 	c(line.data$x + line.data$y),
##D 	c(line.data$x + line.data$y + line.data$z)
##D 	),
##D     line.col = list('red','blue','green'),
##D     line.lwd = list(3,3,3)
##D     );
##D 
##D lollipop.data <- data.frame(
##D     y = seq(1,100,1),
##D     x = rnorm(100)
##D     );
##D 
##D create.lollipopplot(
##D     filename = paste0(tempdir(),"/Lollipop_Simple.tiff"),
##D     formula = x ~ y,
##D     data = lollipop.data,
##D     main = 'Lollipop plot',
##D     xaxis.cex = 1,
##D     xlimits = c(-1,102),
##D     yaxis.cex = 1,
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1,
##D     xlab.cex = 1.5,
##D     ylab.cex = 1.5,
##D     pch = 21,
##D     col = 'black',
##D     fill = 'transparent',
##D     description = 'Scatter plot created by BoutrosLab.plotting.general',
##D     regions.start = c(1,26,48),
##D     regions.stop = c(15,35,72),
##D     regions.labels = c("test 1", "test2", "test 3"),
##D     regions.color = c("#66b3ff", "#5cd65c", "#ff3333")
##D     );
## End(Not run)



