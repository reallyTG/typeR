library(BoutrosLab.plotting.general)


### Name: create.multipanelplot
### Title: Joins plots together
### Aliases: create.multipanelplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D # begin by creating the individual plots which will be combined into a multiplot
##D dist <- data.frame(
##D     a = rnorm(100, 1), 
##D     b = rnorm(100, 3), 
##D     c = rnorm(100, 5)
##D     );
##D 
##D simple.data <- data.frame(
##D     x = c(dist$a, dist$b, dist$c),
##D     y = rep(LETTERS[1:3], each = 100)
##D     );
##D fill.squares <- matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1), ncol = 3, byrow = TRUE);
##D rownames(fill.squares) <- c("Drug I only", "Drug II only" , "Drugs I & II");
##D colnames(fill.squares) <- levels(factor(simple.data$y));
##D 
##D # Create plot # 1
##D simple.boxplot <- create.boxplot(
##D     formula = x ~ y,
##D     data = simple.data,
##D     xaxis.lab = c('','',''),
##D     main.x = 0.57,
##D     ylab.label = 'Sugar Level',
##D     xlab.label = '',
##D     col = 'lightgrey',
##D     xaxis.tck = c(0,0),
##D     yaxis.tck = c(1,0),
##D     yaxis.lab = seq(-1,8,2) ,
##D     yat = seq(-1,8,2),
##D     left.padding = 0,
##D     right.padding = 0,
##D     lwd = 2
##D     );
##D 
##D # Create plot # 2
##D simple.heatmap <- create.heatmap(
##D     x = t(fill.squares),
##D     clustering.method = 'none',
##D     shrink = 0.8,
##D     yaxis.lab = c(3,2,3),
##D     yaxis.tck = 1,
##D     xaxis.lab = c('A','B','C'),
##D     ylab.label = 'Drug Regimen',
##D     xlab.label = 'Patient Group',
##D     colour.scheme = c("white", "grey20"),
##D     fill.colour = "white",
##D     print.colour.key = FALSE,
##D     left.padding = 0,
##D     xaxis.tck = c(1,0),
##D     right.padding = 0,
##D     xaxis.rot = 0
##D     );
##D 
##D create.multipanelplot(
##D     filename = paste0(tempdir(),'/Multipanelplot_Simple.tiff'),
##D     plot.objects = list(simple.boxplot,simple.heatmap), 
##D     y.spacing = 1,  
##D     ylab.axis.padding = 2, 
##D     main = 'Simple', 
##D     top.padding = 2
##D     );
##D 
##D # Create plot # 2
##D simple.heatmap.with.legends <- create.heatmap(
##D     x = t(fill.squares),
##D     shrink = 0.8,
##D     yaxis.lab = c(3,2,3),
##D     yaxis.tck = 1,
##D     xaxis.lab = c('A','B','C'),
##D     ylab.label = 'Drug Regimen',
##D     xlab.label = '',
##D     colour.scheme = c("white", "grey20"),
##D     fill.colour = "white",
##D     left.padding = 0,
##D     xaxis.tck = c(1,0),
##D     right.padding = 0,
##D     xaxis.rot = 0
##D     );
##D 
##D create.multipanelplot(
##D     filename = paste0(tempdir(),'/Multipanelplot_Simple_Legends.tiff'),
##D     plot.objects = list(simple.boxplot,simple.heatmap.with.legends),
##D     y.spacing = 1,
##D     ylab.axis.padding = 2,
##D     main = 'Simple',
##D     top.padding = 2
##D     );
##D 
##D # Create plot # 1
##D simple.boxplot2 <- create.boxplot(
##D     formula = x ~ y,
##D     data = simple.data,
##D     ylab.label = 'Sugar Level',
##D     xlab.label = '',
##D     col = 'lightgrey',
##D     xaxis.tck = c(0,0),
##D     xaxis.lab = c('','',''),
##D     yaxis.tck = c(1,0),
##D     yaxis.lab = seq(-1,8,2),
##D     yat = seq(-1,8,2),
##D     left.padding = 0,
##D     right.padding = 0,
##D     lwd = 2
##D     );
##D 
##D simple.violin2 <- create.violinplot(
##D     formula = x ~ y,
##D     data = simple.data,
##D     col = 'lightgrey',
##D     yaxis.tck = c(0,0),
##D     xlab.label = '',
##D     ylab.label = '',
##D     yaxis.lab = NULL,
##D     xaxis.lab = c('','',''),
##D     xaxis.tck = c(0,0)
##D     );
##D 
##D # Create plot # 2
##D simple.heatmap2 <- create.heatmap(
##D     x = t(fill.squares),
##D     clustering.method = 'none',
##D     shrink = 0.8,
##D     yaxis.lab = c(1,2,3),
##D     yaxis.tck = 1,
##D     xaxis.lab = c('A','B','C'),
##D     ylab.label = 'Drug Regimen',
##D     colour.scheme = c("white", "grey20"),
##D     fill.colour = "white",
##D     print.colour.key = FALSE,
##D     left.padding = 0,
##D     xaxis.tck = c(3,0),
##D     right.padding = 0,
##D     xaxis.rot = 0,
##D     ylab.cex = 2
##D     );
##D 
##D 
##D create.multipanelplot(
##D     filename = paste0(tempdir(),'/Multipanelplot_Simple_Layout.tiff'),
##D     plot.objects = list(simple.boxplot2, 
##D     simple.violin2,simple.heatmap2), 
##D     layout.width = 2, 
##D     layout.height = 2, 
##D     xlab.label = 'Patient Group', 
##D     main = 'Simple Layout', 
##D     top.padding = 2, 
##D     plot.objects.heights = c(3,1), 
##D     x.spacing = 1, 
##D     y.spacing = 1
##D     );
##D 
##D all.data <- data.frame(
##D     a = rnorm(n = 25, mean = 0, sd = 0.75),
##D     b = rnorm(n = 25, mean = 0, sd = 0.75),
##D     c = rnorm(n = 25, mean = 0, sd = 0.75),
##D     d = rnorm(n = 25, mean = 0, sd = 0.75),
##D     e = rnorm(n = 25, mean = 0, sd = 0.75),
##D     f = rnorm(n = 25, mean = 0, sd = 0.75),
##D     x = rnorm(n = 25, mean = 5),
##D     y = seq(1, 25, 1)
##D     );
##D # create the plot -- this allows for previewing of the individual plot
##D barplot.formatted <- create.barplot(
##D     formula = x ~ y,
##D     data = all.data[,7:8],
##D     yaxis.tck = c(1,0),
##D     border.lwd = 0,
##D     col = 'grey',
##D     xlab.label = '',
##D     xat = c(-100),
##D     ylab.label = '',
##D     yaxis.lab = seq(1, ceiling(max(all.data$x)), 1),
##D     yat = seq(1, ceiling(max(all.data$x)), 1),
##D     yaxis.cex = 1.5
##D     );
##D 
##D 
##D heatmap.formatted <- create.heatmap(
##D     x = all.data[,1:6],
##D     clustering.method = 'none',
##D     colour.scheme = c('magenta','white','green'),
##D     print.colour.key = FALSE,
##D     xlab.label = '',
##D     yaxis.tck = c(1,0),
##D     xaxis.tck = c(1,0),
##D     xat = c(1:25),
##D     yaxis.lab = c("BRCA1", "BRCA2", "APC", "TIN", "ARG", "FOO"),
##D     yat = c(1,2,3,4,5,6),
##D     xaxis.lab = c(1:25),
##D     xaxis.rot = 0,
##D     yaxis.cex = 1.5
##D     ); 
##D 
##D create.multipanelplot(
##D     filename = paste0(tempdir(),'/Multipanelplot_formatted.tiff'),
##D     plot.objects = list(barplot.formatted, heatmap.formatted), 
##D     plot.objects.heights = c(1,3), 
##D     y.spacing = -3.75, 
##D     main = 'Formatted', 
##D     top.padding = 0
##D     );
##D 
##D data.bars <- data.frame(
##D     x = sample(x = 5:35, size = 10),
##D     y = seq(1,10,1)
##D     );
##D 
##D data.cov <- data.frame(
##D     x = rnorm(n = 10, mean = 0, sd = 0.75),
##D     y = rnorm(n = 10, mean = 0, sd = 0.75),
##D     z = rnorm(n = 10, mean = 0, sd = 0.75)
##D     );
##D 
##D # Create main barplot
##D bars <- create.barplot(
##D     formula = x~y,
##D     data = data.bars,
##D     ylimits = c(0,35),
##D     ylab.label = '',
##D     sample.order = 'increasing',
##D     border.lwd = 0,
##D     yaxis.lab = seq(5,35,5),
##D     yat = seq(5,35,5),
##D     yaxis.tck = c(0,0),
##D     xlab.label = ''
##D     );
##D 
##D # Make covariate bars out of heatmaps
##D cov.1 <- create.heatmap(
##D     x = as.matrix(data.bars$y),
##D     clustering.method = 'none',
##D     scale.data = FALSE,
##D     colour.scheme = default.colours(4),
##D     grid.col = TRUE,
##D     col.colour = 'black',
##D     # col.lwd = 10,
##D     total.col = 5,
##D     print.colour.key = FALSE,
##D     yaxis.tck = 0,
##D     axes.lwd = 0
##D     );
##D 
##D cov.2 <- create.heatmap(
##D     x = as.matrix(data.cov$y),
##D     clustering.method = 'none',
##D     scale.data = FALSE,
##D     colour.scheme = c("lightblue","dodgerblue2", "dodgerblue4"),
##D     grid.col = TRUE,
##D     col.colour = 'black',
##D     # col.lwd = 10,
##D     total.col = 4,
##D     print.colour.key = FALSE,
##D     yaxis.tck = 0
##D     );
##D 
##D cov.3 <- create.heatmap(
##D     x = as.matrix(data.cov$z),
##D     clustering.method = 'none',
##D     scale.data = FALSE,
##D     colour.scheme = c("grey","coral1"),
##D     grid.col = TRUE,
##D     col.colour = 'black',
##D     # col.lwd = 10,
##D     total.col = 3,
##D     print.colour.key = FALSE,
##D     yaxis.tck = 0
##D     );
##D 
##D 
##D legendG <- legend.grob(
##D     list(
##D         legend = list(
##D             colours = default.colours(4),
##D             title = "Batch",
##D             labels = LETTERS[1:4],
##D             size = 3,
##D             title.cex = 1,
##D             label.cex = 1,
##D             border = 'black'
##D             ),
##D         legend = list(
##D             colours = c("lightblue","dodgerblue2","dodgerblue4"),
##D             title = "Grade",
##D             labels = c("Low","Normal","High"),
##D             size = 3,
##D             title.cex = 1,
##D             label.cex = 1,
##D             border = 'black'
##D             ),
##D         legend = list(
##D             colours = c("grey","coral1"),
##D             title = "Biomarker",
##D             labels = c("Not present","Present"),
##D             size = 3,
##D             title.cex = 1,
##D             label.cex = 1,
##D             border = 'black'
##D             )
##D         ),
##D         label.cex = 1.25,
##D     	title.cex = 1.25,
##D     	title.just = 'left',
##D    	title.fontface = 'bold.italic',
##D    	size = 3,
##D    	layout = c(1,3)
##D     	);
##D 
##D create.multipanelplot(
##D     filename = paste0(tempdir(),'/Multipanelplot_Barchart.tiff'),
##D     plot.objects = list(bars, cov.3, cov.2, cov.1 ), 	
##D     plot.objects.heights = c(1, 0.1,0.1,0.1), 
##D     legend = list(right = list(fun = legendG)), 
##D     ylab.label = 'Response to Treatment', 
##D     main = 'Bar Chart',
##D     x.spacing = 0, 
##D     y.spacing = 0.1
##D     );
##D 
##D # Set up plots for complex example
##D 
##D # Dotmap
##D spot.sizes <- function(x) { 0.5 * abs(x); }
##D dotmap.dot.colours <- c('red','blue');
##D spot.colours <- function(x) {
##D     colours <- rep('white', length(x));
##D     colours[sign(x) == -1] <- dotmap.dot.colours[1];
##D     colours[sign(x) ==  1] <- dotmap.dot.colours[2];
##D     return(colours);
##D     };
##D 
##D # Dotmap colours
##D orange <- rgb(249/255, 179/255, 142/255);
##D blue <- rgb(154/255, 163/255, 242/255);
##D green <- rgb(177/255, 213/255, 181/255);
##D bg.colours <- c(green, orange, blue, 'gold', 'skyblue', 'plum');
##D 
##D dotmap <- create.dotmap(
##D     x = CNA[1:15,1:58],
##D     bg.data = SNV[1:15,1:58],
##D     # Set the colour scheme
##D     colour.scheme = bg.colours,
##D     # Set the breakpoints for the colour scheme (determined from the data)
##D     at = c(0,1,2,4,6,7,8),
##D     # Specify the total number of colours (+1 for the fill colour)
##D     total.colours = 7,
##D     col.colour = 'white',
##D     row.colour = 'white',
##D     bg.alpha = 1,
##D     yaxis.tck = c(1,0),
##D     fill.colour = 'grey95',
##D     spot.size.function = spot.sizes,
##D     spot.colour.function = spot.colours,
##D     xaxis.tck = 0,
##D     xaxis.lab = c(rep('',100)),
##D     bottom.padding = 0, 
##D     top.padding = 0,
##D     left.padding = 0,
##D     right.padding = 0,
##D     yaxis.cex = 1
##D     );
##D 
##D # Dotmap legend
##D dotmap.legend <- list(
##D     legend = list(
##D         colours = bg.colours,
##D         labels = c('Nonsynonymous','Stop Gain','Frameshift deletion', 
##D             'Nonframeshift deletion', 'Splicing', 'Unknown'),
##D         border = 'white',
##D         title = 'SNV',
##D         pch = 15
##D         ),
##D     legend = list(
##D         colours = dotmap.dot.colours,
##D         labels = c('Gain','Loss'),
##D         border = 'white',
##D         title = 'CNA',
##D         pch = 19
##D         )
##D     );
##D 
##D dotmap.legend.grob <- legend.grob(
##D     legends = dotmap.legend,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7
##D     );
##D 
##D # Covariates
##D cov.colours <- c(
##D     c('dodgerblue','pink'),
##D     c('grey','darkseagreen1','seagreen2','springgreen3','springgreen4'),
##D     c('peachpuff','tan4')
##D     );
##D 
##D # the heatmap expects numeric data
##D cov.data <- patient[-c(4:9)];
##D cov.data[cov.data == 'male'] <- 1;
##D cov.data[cov.data == 'female'] <- 2;
##D cov.data[is.na(cov.data)] <- 3;
##D cov.data[cov.data == 'I'] <- 4;
##D cov.data[cov.data == 'II'] <- 5;
##D cov.data[cov.data == 'III'] <- 6;
##D cov.data[cov.data == 'IV'] <- 7;
##D cov.data[cov.data == 'MSS'] <- 8;
##D cov.data[cov.data == 'MSI-High'] <- 9;
##D cov.data$sex <- as.numeric(cov.data$sex);
##D cov.data$stage <- as.numeric(cov.data$stage);
##D cov.data$msi <- as.numeric(cov.data$msi);
##D 
##D covariates <- create.heatmap(
##D     x = cov.data,
##D     clustering.method = 'none',
##D     colour.scheme = as.vector(cov.colours),
##D     total.colours = 10,
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     xaxis.lab = c(rep('',100)),
##D     yaxis.lab = c('Sex','Stage','MSI'),
##D     yaxis.tck = c(0,0),
##D     xaxis.tck = c(0,0),
##D     xat = c(1:100),
##D     print.colour.key = FALSE,
##D     yaxis.cex = 1,
##D     bottom.padding = 0, 
##D     top.padding = 0,
##D     left.padding = 0,
##D     right.padding = 0
##D     );
##D 
##D ## Warning: number of columns exceeded limit (50), column lines are 
##D ## turned off. Please set "force.grid.col" to TRUE to override this
##D 
##D # Coviate Legends
##D cov.legends <- list(
##D     legend = list(
##D         colours = cov.colours[8:9],
##D         labels = c('MSS','MSI-High'),
##D         border = 'white',
##D         title = 'MSI'
##D         ),
##D     legend = list(
##D         colours = cov.colours[3:7], 
##D         labels = c('NA', 'I','II','III','IV'),
##D         border = 'white',
##D         title = 'Stage'
##D         ),
##D     legend = list(
##D         colours = cov.colours[1:2],
##D         labels = c('Male','Female'),
##D         border = 'white',
##D         title = 'Sex'
##D         )
##D     );
##D 
##D cov.legend.grob <- legend.grob(
##D     legends = cov.legends,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7,
##D     layout = c(3,1)
##D     );
##D 
##D 
##D create.multipanelplot(
##D     filename = paste0(tempdir(),'/Multipanelplot_with_heatmap.tiff'),
##D     plot.objects = list(dotmap,covariates), 
##D     plot.objects.heights = c(1,0.2), 
##D     y.spacing = -0.8, 
##D     main = 'Dotmap', 
##D     top.padding = 2,
##D     layout.height = 2,
##D     legend = list(
##D         bottom = list(
##D             x = 0.10,
##D             y = 0.50,
##D             fun = cov.legend.grob
##D             ),
##D         right = list(
##D             x = 0.10,
##D             y = 0.50,
##D             fun = dotmap.legend.grob
##D             )
##D         )
##D     );
##D 
##D # Add more plots, using more complex layout
##D # grouped barplot
##D groupedbar.colours <- c('indianred1','indianred4');
##D 
##D count.SNV <- apply(SNV[1:15,], 2, function(x){length(which(!is.na(x)))});
##D count.CNA <- apply(CNA[1:15,], 2, function(x){length(which(!(x==0)))});
##D 
##D grouped.data <- data.frame(
##D     values = c(count.SNV, count.CNA),
##D     samples = rep(colnames(SNV),2),
##D     group = rep(c('SNV','CNA'), each = 58)
##D     );
##D 
##D grouped.barplot <- create.barplot(
##D     formula = values ~ samples,
##D     data = grouped.data,
##D     groups = grouped.data$group,
##D     col = groupedbar.colours,
##D     top.padding = 0,
##D     bottom.padding = 0,
##D     left.padding = 0,
##D     right.padding = 0,
##D     border.col = 'white',
##D     xlab.label = '',
##D     ylab.label = 'Mutation',
##D     yaxis.lab = c(0,5,10,15),
##D     yat = c(0,5,10,15),
##D     xaxis.lab = c(rep('',100)),
##D     yaxis.tck = c(0,0),
##D     xaxis.tck = c(0,0),
##D     ylab.cex = 1.5,
##D     yaxis.cex = 1,
##D     axes.lwd = 2
##D     );
##D 
##D # stacked barplot
##D col.one <- rgb(255/255, 225/255, 238/255);
##D col.two <- rgb(244/255, 224/255, 166/255);
##D col.thr <- rgb(177/255, 211/255, 154/255);
##D col.fou <- rgb(101/255, 180/255, 162/255);
##D col.fiv <- rgb(51/255, 106/255, 144/255);
##D stackedbar.colours <- c(col.one, col.two, col.thr, col.fou, col.fiv, 'orchid4');
##D stacked.data.labels <- c('C>A/G>T','C>T/G>A','C>G/G>C','T>A/A>T','T>G/A>C', 'T>C/A>G');
##D 
##D stacked.data <- data.frame(
##D     values = c(patient$prop.CAGT, patient$prop.CTGA, patient$prop.CGGC, patient$prop.TAAT, 
##D         patient$prop.TGAC, patient$prop.TCAG), 
##D     divisions = rep(rownames(patient), 6),
##D     group = rep(stacked.data.labels, each = 58)
##D     );
##D 
##D # Generate stacked barplot
##D stacked.barplot <- create.barplot(
##D     formula = values ~ divisions,
##D     data = stacked.data,
##D     groups = stacked.data$group,
##D     stack = TRUE,
##D     col = stackedbar.colours,
##D     border.col = 'white',
##D     main = '',
##D     xlab.label = '',
##D     ylab.label = 'Proportion',
##D     yaxis.lab = c(0,0.4,0.8),
##D     yat = c(0,0.4,0.8),
##D     xaxis.lab = c(rep('',100)),
##D 	yaxis.tck = c(0,0),
##D     xaxis.tck = c(0,0),
##D     ylab.cex = 1.5,
##D     yaxis.cex = 1,
##D     axes.lwd = 2
##D     );
##D 
##D # barchart legends
##D stackedbar.legend <- list(
##D     legend = list(
##D         colours = rev(stackedbar.colours),
##D         labels = rev(stacked.data.labels),
##D         border = 'white'
##D         )
##D     );
##D 
##D groupedbar.legend <- list(
##D     legend = list(
##D         colours = groupedbar.colours,
##D         labels = c('CNA','SNV'),
##D         border = 'white'
##D         )
##D     );
##D 
##D groupedbar.legend.grob <- legend.grob(
##D     legends = groupedbar.legend,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7
##D     );
##D 
##D stackedbar.legend.grob <- legend.grob(
##D     legends = stackedbar.legend,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7
##D     );
##D 
##D # Expression change Segplot
##D # locate matching genes
##D rows.to.keep <- which(match(rownames(microarray), rownames(SNV)[1:15], nomatch = 0) > 0);
##D 
##D segplot.data <- data.frame(
##D     min = apply(microarray[rows.to.keep,1:58], 1, min),
##D     max = apply(microarray[rows.to.keep,1:58], 1, max),
##D     median = apply(microarray[rows.to.keep,1:58], 1, median),
##D     order = seq(1,15,1)
##D     );
##D 
##D segplot <- create.segplot(
##D     formula = order ~ min + max,
##D     data = segplot.data,
##D     main = '',
##D     xlab.label = '',
##D     ylab.label = '',
##D     centers = segplot.data$median,
##D     yaxis.lab = c('','','','','',''),
##D     xaxis.lab = c('0','2','4','6','8'),
##D     xat = c(0,2,4,6,8),
##D     yaxis.tck = c(0,0),
##D     xaxis.tck = c(1,0),
##D     axes.lwd = 2,
##D 	
##D     top.padding = 0,
##D     left.padding = 0,
##D     right.padding = 0,
##D     bottom.padding = 0
##D     );
##D # Create multiplot
##D 
##D plots <- list(grouped.barplot,stacked.barplot,dotmap, segplot,covariates);
##D create.multipanelplot(
##D     main.x = 0.47,
##D     main.y = 0.5,
##D     plot.objects = plots,
##D     plot.objects.heights = c(0.3, 0.3, 1, 0.15),
##D     plot.objects.widths = c(1,0.2),
##D     filename = paste0(tempdir(),"/Multipanelplot_Complex.tiff"),
##D     layout.height = 4,
##D     layout.width = 2,
##D     x.spacing = 0.2,
##D     left.padding = 0,
##D     layout.skip = c(FALSE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,TRUE),
##D     y.spacing = c(-1.35,-1.35,-1.5),
##D     ylab.axis.padding = c(1,0),
##D     legend = list(
##D         left = list(
##D             fun = dotmap.legend.grob,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         pch = c(15,15,19,19)
##D                         )
##D                     )
##D                 )
##D             )
##D     ),
##D     height = 12,
##D     width = 12,
##D     main = 'Complex', 
##D     top.padding = 2
##D     );
##D # Create a multiplot with a heatmap, key like legend and barplot
##D 
##D # First create a heatmap object
##D simple.heatmap <- create.heatmap(patient[, 4:6],
##D    clustering.method = 'none',
##D    print.colour.key = FALSE,
##D    same.as.matrix = FALSE,
##D    colour.scheme = c('gray0','grey100'),
##D    fill.colour = 'grey95',
##D    xaxis.lab = c(rep('',100)),
##D    xat = c(0,1,2,3,4,5,6,7,8),
##D    yaxis.lab = c('','',''),
##D    yat = c(0,1,2),
##D    xlab.label = ''
##D );
##D 
##D 
##D # and a simple bar plot
##D pvals <- data.frame(
##D     order = c(1:3),
##D     pvalue = -log10(c(0.0004, 0.045, 0.0001)),
##D     stringsAsFactors = FALSE
##D         )
##D #create bar plot
##D simple.bar <- create.barplot(
##D     formula = order ~ rev(pvalue),
##D     data = pvals,
##D     xlimits = c(0,5),
##D     plot.horizontal=TRUE,
##D     xlab.label = '',
##D     ylab.label = '',
##D     yaxis.lab = c(1,2,3)
##D     );
##D 
##D # then the covariates heatmap
##D cov.colours <- c(
##D     c('dodgerblue','pink'),
##D     c('grey','darkseagreen1','seagreen2','springgreen3','springgreen4'),
##D     c('peachpuff','tan4')
##D     );
##D 
##D # the heatmap expects numeric data
##D cov.data <- patient[-c(4:9)];
##D cov.data[cov.data == 'male'] <- 1;
##D cov.data[cov.data == 'female'] <- 2;
##D cov.data[is.na(cov.data)] <- 3;
##D cov.data[cov.data == 'I'] <- 4;
##D cov.data[cov.data == 'II'] <- 5;
##D cov.data[cov.data == 'III'] <- 6;
##D cov.data[cov.data == 'IV'] <- 7;
##D cov.data[cov.data == 'MSS'] <- 8;
##D cov.data[cov.data == 'MSI-High'] <- 9;
##D cov.data$sex <- as.numeric(cov.data$sex);
##D cov.data$stage <- as.numeric(cov.data$stage);
##D cov.data$msi <- as.numeric(cov.data$msi);
##D 
##D covariates <- create.heatmap(
##D     x = cov.data,
##D     clustering.method = 'none',
##D     colour.scheme = as.vector(cov.colours),
##D     total.colours = 10,
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     yaxis.tck = 0,
##D     print.colour.key = FALSE,
##D     xaxis.lab = c('','',''),
##D     xlab.label = '',
##D     xat = c(1,2,3)
##D     );
##D 
##D ## Warning: number of columns exceeded limit (50), column 
##D ## lines are turned off. Please set "force.grid.col" to TRUE to override this
##D 
##D covariates2 <- create.heatmap(
##D     x = patient[4],
##D     clustering.method = 'none',
##D     colour.scheme = c("#00007F", "#007FFF"),
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     yaxis.tck = 0,
##D     print.colour.key = FALSE,
##D     xaxis.lab = c('','',''),
##D     xlab.label = '',
##D     xat = c(1,2,3)
##D     );
##D 
##D ## Warning: number of rows exceeded limit (50), row 
##D ## lines are turned off. Please set "force.grid.row" to TRUE to override this
##D 
##D 
##D cov.legends <- list(
##D     legend = list(
##D         colours = c("white", "black"),
##D         labels = c('0','2'),
##D         border = 'grey',
##D         title = 'Tumour Mass (kg)',
##D         continuous = TRUE,
##D         height = 3
##D         ),
##D     legend = list(
##D         colours = cov.colours[8:9],
##D         labels = c('MSS','MSI-High'),
##D         border = 'white',
##D         title = 'MSI'
##D         ),
##D     legend = list(
##D         colours = cov.colours[3:7],
##D         labels = c('NA', 'I','II','III','IV'),
##D         border = 'white',
##D         title = 'Stage'
##D         ),
##D     legend = list(
##D         colours = cov.colours[1:2],
##D         labels = c('Male','Female'),
##D         border = 'white',
##D         title = 'Sex'
##D         ),
##D     legend = list(
##D         colours = c("#00007F", "#007FFF"),
##D         labels = c('0.09','0.72'),
##D         border = 'grey',
##D         title = 'CAGT',
##D         continuous = TRUE,
##D         height = 2,
##D         width = 3,
##D         angle = -90,
##D         tck = 1,
##D         tck.number = 2,
##D         at = c(0,100)
##D         )
##D     );
##D 
##D cov.legend.grob <- legend.grob(
##D     legends = cov.legends,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7
##D     );
##D 
##D # Now bring it was together using multiplot
##D create.multipanelplot(
##D     filename = paste0(tempdir(), '/Multipanelplot_continousLegend.tiff'),
##D     plot.objects = list(simple.heatmap, simple.bar,covariates2,covariates),
##D     plot.objects.heights = c(1,0.1,0.35),
##D     plot.objects.widths = c(1,0.25),
##D     layout.height = 3,
##D     layout.width = 2,
##D     layout.skip = c(FALSE, FALSE,FALSE,TRUE,FALSE,TRUE),
##D     y.spacing = -0.1,
##D     x.spacing = 0.5,
##D     legend = list(
##D         left = list(
##D             fun = cov.legend.grob
##D             )
##D         ),
##D     main = 'Continous Legend', 
##D     top.legend.padding = 4,
##D     top.padding = -2,
##D     left.padding = 1 
##D     # This parameter must be set for the legend to appear
##D     );
##D 
##D  create.multipanelplot(
##D     filename = paste0(tempdir(),'Multipanelplot_manyPlots.tiff'),
##D     main = 'Large Scale',
##D     plot.objects = list(
##D 	simple.boxplot,
##D 	simple.heatmap,
##D 	simple.bar,
##D 	barplot.formatted,
##D 	dotmap,
##D 	grouped.barplot,
##D 	stacked.barplot,
##D 	covariates,
##D 	covariates2,
##D 	heatmap.formatted
##D 	),
##D     plot.objects.heights = c(1,1,1,1),
##D     plot.objects.widths = c(1,1, 1,1),
##D     layout.height = 4,
##D     layout.width = 4,
##D     top.legend.padding = 3,
##D     layout.skip = c(FALSE, FALSE,FALSE,FALSE,FALSE,TRUE,
##D 		TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE),
##D     y.spacing = c(-1,-1,-1),
##D     x.spacing = c(1,2,3),
##D     legend = list(
##D         left = list(
##D             fun = cov.legend.grob
##D             )
##D         ),
##D     height = 12,
##D     width = 12
##D     # This parameter must be set for the legend to appear
##D     );
##D 
## End(Not run)



