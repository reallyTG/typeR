library(BoutrosLab.plotting.general)


### Name: create.multiplot
### Title: Joins plots together
### Aliases: create.multiplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D 
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
##D 
##D fill.squares <- matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1), ncol = 3, byrow = TRUE);
##D rownames(fill.squares) <- c("Drug I only", "Drug II only" , "Drugs I & II");
##D colnames(fill.squares) <- levels(factor(simple.data$y));
##D 
##D # Create plot # 1
##D simple.boxplot <- create.boxplot(
##D     formula = x ~ y,
##D     data = simple.data,
##D     col = 'lightgrey'
##D     );
##D 
##D # Create plot # 2
##D simple.heatmap <- create.heatmap(
##D         x = t(fill.squares),
##D         clustering.method = 'none',
##D         shrink = 0.8,
##D         colour.scheme = c("white", "grey20"),
##D         fill.colour = "white",
##D         print.colour.key = FALSE
##D         );
##D 
##D # Simple example of multiplot
##D # This example uses the defaults set in simple.heatmap and simple.boxplot 
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Simple.tiff'),
##D         plot.objects = list(simple.heatmap, simple.boxplot),
##D         main = "Simple",
##D         xlab.label = c("Patient Group"),
##D         # The plotting function throws an error if this is not included
##D         ylab.label = c("Sugar Level", "Drug Regimen"),
##D         ylab.padding = 7,
##D         # Parameters set in the multiplot will override settings in individual plots
##D         xaxis.cex = 0.7,
##D         yaxis.cex = 0.7
##D         );
##D 
##D # Simple example of multiplot with adjusted plot sizes
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Simple_Plot_Sizes.tiff'),
##D         plot.objects = list(simple.heatmap, simple.boxplot),
##D         main = "Simple plot sizes",
##D         xlab.label = c("Patient Group"),
##D         # y-axis labels must be spaced with tabs or spaces to properly align
##D         ylab.label = c("", "Sugar Level", "", "Drug Regimen"),
##D         ylab.padding = 7,
##D         xaxis.cex = 0.7,
##D         yaxis.cex = 0.7,
##D         # Set the relative heights of the plots
##D         panel.heights = c(3,1)
##D         );
##D 
##D simple.violin <- create.violinplot(
##D     formula = x ~ y,
##D     data = simple.data,
##D     col = 'lightgrey'
##D     );
##D 
##D # Simple example of multiplot with custom layout
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Simple_Layout.tiff'),
##D     plot.objects = list(simple.heatmap, simple.boxplot, simple.violin),
##D     main = "Simple layout",
##D     xlab.label = c("Patient Group"),
##D     ylab.label = c("", "Sugar Level", "", "Drug Regimen"),
##D     ylab.padding = 7,
##D     xaxis.cex = 0.7,
##D     yaxis.cex = 0.7,
##D     panel.heights = c(3,1),
##D     # Set how many rows & columns are in the layout
##D     plot.layout = c(2,2),
##D     # Set whether to plot or not in the space (fills from bottom left to top right)
##D     layout.skip = c(FALSE, TRUE, FALSE, FALSE),
##D     # Move plots closer together
##D     x.spacing = 0,
##D     # Remove doubled internal axis
##D     yat = list(
##D         seq(1,3,1),
##D         seq(-2, 8, 2),
##D         c()
##D         )
##D     );
##D 
##D # Example of how to take parameter values from individual plots
##D # This programming structure allows for including the individual customization 
##D # of plots to the final multiplot
##D all_data <- data.frame(
##D     a = rnorm(n = 25, mean = 0, sd = 0.75),
##D     b = rnorm(n = 25, mean = 0, sd = 0.75),
##D     c = rnorm(n = 25, mean = 0, sd = 0.75),
##D     d = rnorm(n = 25, mean = 0, sd = 0.75),
##D     e = rnorm(n = 25, mean = 0, sd = 0.75),
##D     f = rnorm(n = 25, mean = 0, sd = 0.75),
##D     x = rnorm(n = 25, mean = 5),
##D     y = seq(1, 25, 1)
##D     );
##D 
##D plot.heatmap <- function(all_data){
##D     # save the parameter values that will be reused in the multiplot
##D     multiplot_visuals <- list(
##D         xlab.label = '',
##D         xaxis.labels = NULL,
##D         xat = NULL,
##D         ylab.label = 'Genes of Interest',
##D         yaxis.labels = c("BRCA1", "BRCA2", "APC", "TIN", "ARG", "FOO"),
##D         yat = c(1,2,3,4,5,6)
##D         );
##D 
##D     # create the plot -- this allows for previewing of the individual plot
##D     heatmap.formatted <- create.heatmap(
##D         x = all_data[,1:6],
##D         clustering.method = 'none',
##D         colour.scheme = c('magenta','white','green'),
##D         print.colour.key = FALSE,
##D         xlab.label = multiplot_visuals$xlab.label,
##D         xaxis.lab = multiplot_visuals$xaxis.labels,
##D         xat = multiplot_visuals$xat,
##D         ylab.label = multiplot_visuals$ylab.label,
##D         yaxis.lab = multiplot_visuals$yaxis.labels,
##D         yat = multiplot_visuals$yat 
##D         ); 
##D 
##D     # return both the plot and the relevant parameter values
##D     return(
##D         list(
##D             the_plot = heatmap.formatted,
##D             visuals = multiplot_visuals
##D             )
##D         )
##D }
##D 
##D plot.barplot <- function(all_data) {
##D 
##D     # save the parameter values that will be reused in the multiplot
##D     multiplot_visuals <- list(
##D         xlab.label = '',
##D         xaxis.labels = NULL,
##D         xat = NULL,
##D         ylab.label = 'Importance',
##D         yaxis.labels = seq(1, ceiling(max(all_data$x)), 1),
##D         yat = seq(1, ceiling(max(all_data$x)), 1)
##D         );
##D 
##D     # create the plot -- this allows for previewing of the individual plot
##D     barplot.formatted <- create.barplot(
##D         formula = x ~ y,
##D         data = all_data[,7:8],
##D         border.lwd = 0,
##D         col = 'grey',
##D         xlab.label = multiplot_visuals$xlab.label,
##D         xaxis.lab = multiplot_visuals$xaxis.labels,
##D         xat = multiplot_visuals$xat,
##D         ylab.label = multiplot_visuals$ylab.label,
##D         yaxis.lab = multiplot_visuals$yaxis.labels,
##D         yat = multiplot_visuals$yat
##D         );
##D 
##D     # return both the plot and the relevant parameter values
##D     return(
##D         list(
##D             the_plot = barplot.formatted,
##D             visuals = multiplot_visuals
##D             )
##D         )
##D     }
##D 
##D plot_functions <- c('plot.heatmap', 'plot.barplot');
##D 
##D # run the functions
##D all_plots <- lapply(
##D     plot_functions, 
##D     function(funName){
##D         eval(parse(text = paste0(funName, '(all_data)')))
##D         }
##D     );
##D 
##D create.multiplot(
##D     filename = paste0(tempdir(),"/Multiplot_Formatting"),
##D     main = "Formatting",
##D     plot.objects = lapply(all_plots, function(aPlot) aPlot$the_plot),
##D     panel.heights = c(1,3),
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     ylab.padding = 8,
##D     yat = lapply(all_plots,function(aPlot) aPlot$visuals$yat),
##D     xlab.label = lapply(all_plots,function(aPlot) aPlot$visuals$xlab.label),
##D     ylab.label = rev(lapply(all_plots,function(aPlot) aPlot$visuals$ylab.label)),
##D     yaxis.labels = lapply(all_plots,function(aPlot) aPlot$visuals$yaxis.labels)
##D     );
##D 
##D 
##D data_bars <- data.frame(
##D     x = sample(x = 5:35, size = 10),
##D     y = seq(1,10,1)
##D     );
##D 
##D data_cov <- data.frame(
##D     x = rnorm(n = 10, mean = 0, sd = 0.75),
##D     y = rnorm(n = 10, mean = 0, sd = 0.75),
##D     z = rnorm(n = 10, mean = 0, sd = 0.75)
##D     );
##D 
##D # Create main barplot
##D bars <- create.barplot(
##D     formula = x~y,
##D     data = data_bars,
##D     ylimits = c(0,35),
##D     sample.order = 'increasing',
##D     border.lwd = 0
##D     );
##D 
##D # Make covariate bars out of heatmaps
##D cov_1 <- create.heatmap(
##D     x = as.matrix(data_bars$y),
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
##D cov_2 <- create.heatmap(
##D     x = as.matrix(data_cov$y),
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
##D cov_3 <- create.heatmap(
##D     x = as.matrix(data_cov$z),
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
##D # Generate legends outside of individual functions
##D legend <- legend.grob(
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
##D     title.just = 'left'
##D     );
##D 
##D # Assemble plot using multiplot function
##D create.multiplot(
##D     filename = paste0(tempdir(),"/Multiplot_Barchart.tiff"),
##D     main = 'Multiplot with bar chart',
##D     plot.objects = list(cov_3, cov_2, cov_1, bars),
##D     ylab.label = c("\t", "Response to treatment","\t"),
##D     xlab.label = "Sample characteristics",
##D     panel.heights = c(1, 0.05,0.05,0.05),
##D     y.spacing = c(-1, -1, -1, 0),
##D     xaxis.lab = NULL,
##D     yaxis.lab = list(NULL, NULL, NULL, seq(0, 350, 50)),
##D     legend = list(right = list(fun = legend)),
##D     print.new.legend = TRUE,
##D     xaxis.alternating = 0,
##D     main.cex = 1,
##D     ylab.cex = 1,
##D     xlab.cex = 1,
##D     xlab.to.xaxis.padding = -2,
##D     yaxis.cex = 1,
##D     description = "Multiplot example created by BoutrosLab.plotting.general"
##D     );
##D 
##D gene_data <- data.frame(
##D     x = rnorm(n = 25, mean = 0, sd = 0.75),
##D     y = rnorm(n = 25, mean = 0, sd = 0.75),
##D     z = rnorm(n = 25, mean = 0, sd = 0.75),
##D     v = rnorm(n = 25, mean = 0, sd = 0.75),
##D     w = rnorm(n = 25, mean = 0, sd = 0.75),
##D     a = rnorm(n = 25, mean = 0, sd = 0.75),
##D     b = rnorm(n = 25, mean = 0, sd = 0.75),
##D     c = rnorm(n = 25, mean = 0, sd = 0.75)
##D     );
##D 
##D # main heatmap
##D main <- create.heatmap(
##D     x = gene_data,
##D     xaxis.tck = 0,
##D     yaxis.tck = 0,
##D     colourkey.cex = 1,
##D     clustering.method = 'none',
##D     axes.lwd = 1,
##D     ylab.label = 'y',
##D     xlab.label = 'x',
##D     yaxis.fontface = 1,
##D     xaxis.fontface = 1,
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     main.cex = 1,
##D     colour.scheme = c('red','white','turquoise')
##D     );
##D 
##D key_data <- data.frame(
##D     x <- seq(-50,50,1)
##D     );
##D 
##D # colour key for heatmap
##D key <- create.heatmap(
##D     x = key_data,
##D     clustering.method = 'none',
##D     scale.data = FALSE,
##D     colour.scheme = c('turquoise','white','red'),
##D     print.colour.key = FALSE,
##D     yaxis.tck = 0,
##D     xat = c(10,90),
##D     xaxis.lab = c('low', 'high')
##D     );
##D 
##D top_data <- data.frame(
##D     x = rnorm(n = 25, mean = 0, sd = 0.75),
##D     y = seq(1,25,1)
##D     );
##D 
##D # top barplot
##D top <- create.barplot(
##D     formula = x~y,
##D     data = top_data,
##D     border.lwd = 0
##D     );
##D 
##D side_data <- data.frame(
##D     x = rnorm(n = 8, mean = 0, sd = 0.75),
##D     y = seq(1,8,1)
##D     );
##D 
##D # side barplot
##D side <- create.barplot(
##D     formula = x~y,
##D     data = side_data,
##D     border.lwd = 0,
##D     sample.order = 'decreasing',
##D     plot.horizontal = TRUE
##D     );
##D 
##D # assembling final figure
##D create.multiplot(
##D     filename = paste0(tempdir(),"/Multiplot_with_heatmap.tiff"),
##D     main = 'Multiplot with heatmap',
##D     plot.objects = list(key, main, side, top),
##D     panel.heights = c(0.25, 1, 0.05),
##D     panel.widths = c(1, 0.25),
##D     plot.layout = c(2, 3),
##D     layout.skip = c(FALSE, TRUE, FALSE, FALSE, FALSE, FALSE),
##D     xaxis.alternating = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     xlab.cex = 1,
##D     ylab.cex = 1,
##D     xlab.label = c('\t', 'Samples', '\t', '    Importance'),
##D     ylab.label = c( 'Amount (g)', '\t', '\t', 'Genes', '\t', '\t'),
##D     ylab.padding = 6,
##D     xlab.to.xaxis.padding = 0,
##D     xaxis.lab = list(
##D         c("",'low',"", "",'high', ""),
##D         LETTERS[1:25],
##D         seq(0,5,1),
##D         NULL
##D         ),
##D     yaxis.lab = list(
##D         NULL,
##D         replicate(8, paste(sample(LETTERS, 4, replace = TRUE), collapse = "")),
##D         NULL,
##D         seq(0,4,0.05)
##D         ),
##D     x.spacing = -0.5,
##D     y.spacing = c(0,-1),
##D     xaxis.fontface = 1,
##D     yaxis.fontface = 1
##D     );
##D 
##D 
##D # Set up plots for complex example
##D 
##D # Dotmap
##D spot_sizes <- function(x) { 0.5 * abs(x); }
##D dotmap_dot_colours <- c('red','blue');
##D spot_colours <- function(x) {
##D     colours <- rep('white', length(x));
##D     colours[sign(x) == -1] <- dotmap_dot_colours[1];
##D     colours[sign(x) ==  1] <- dotmap_dot_colours[2];
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
##D     fill.colour = 'grey95',
##D     spot.size.function = spot_sizes,
##D     spot.colour.function = spot_colours,
##D     xaxis.tck = 0,
##D     xaxis.cex = 0.7,
##D     yaxis.cex = 0.7,
##D     xaxis.rot = 90
##D     );
##D 
##D # Dotmap legend
##D dotmap_legend <- list(
##D     legend = list(
##D         colours = bg.colours,
##D         labels = c('Nonsynonymous','Stop Gain','Frameshift deletion', 
##D             'Nonframeshift deletion', 'Splicing', 'Unknown'),
##D         border = 'white',
##D         title = 'SNV',
##D         pch = 15
##D         ),
##D     legend = list(
##D         colours = dotmap_dot_colours,
##D         labels = c('Gain','Loss'),
##D         border = 'white',
##D         title = 'CNA',
##D         pch = 19
##D         )
##D     );
##D 
##D dotmap_legend.grob <- legend.grob(
##D     legends = dotmap_legend,
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
##D     yaxis.tck = 0,
##D     print.colour.key = FALSE
##D     );
##D 
##D # Coviate Legends
##D cov_legends <- list(
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
##D cov_legend.grob <- legend.grob(
##D     legends = cov_legends,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7,
##D     layout = c(3,1)
##D     );
##D 
##D # Multiplot of dotmap and covariates
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Dotmap_Cov.tiff'),
##D     plot.objects = list(covariates, dotmap),
##D     main = 'Dotmap & covariates',
##D     panel.heights = c(1,0.1),
##D     # Set some of the yat to NULL to let R figure it out
##D     yat = c(seq(1,15,1), NULL),
##D     xat = NULL,
##D     yaxis.lab = list(
##D         c('Sex','Stage','MSI'),
##D         rev(rownames(SNV)[1:15])
##D         ),
##D     yaxis.cex = 0.7,
##D     y.spacing = -1,
##D     legend = list(
##D         bottom = list(
##D             x = 0.10,
##D             y = 0.50,
##D             fun = cov_legend.grob
##D             ),
##D         right = list(
##D             x = 0.10,
##D             y = 0.50,
##D             fun = dotmap_legend.grob
##D             )
##D         ),
##D     # This parameter must be set for the legend to appear
##D     print.new.legend = TRUE,
##D     # Adding spacing for the legend
##D     bottom.padding = 5
##D     );
##D 
##D # Add more plots, using more complex layout
##D # grouped barplot
##D groupedbar_colours <- c('indianred1','indianred4');
##D 
##D count.SNV <- apply(SNV[1:15,], 2, function(x){length(which(!is.na(x)))});
##D count.CNA <- apply(CNA[1:15,], 2, function(x){length(which(!(x==0)))});
##D 
##D grouped_data <- data.frame(
##D     values = c(count.SNV, count.CNA),
##D     samples = rep(colnames(SNV),2),
##D     group = rep(c('SNV','CNA'), each = 58)
##D     );
##D 
##D grouped_barplot <- create.barplot(
##D     formula = values ~ samples,
##D     data = grouped_data,
##D     groups = grouped_data$group,
##D     col = groupedbar_colours,
##D     border.col = 'white'
##D     );
##D 
##D # stacked barplot
##D col_one <- rgb(255/255, 225/255, 238/255);
##D col_two <- rgb(244/255, 224/255, 166/255);
##D col_thr <- rgb(177/255, 211/255, 154/255);
##D col_fou <- rgb(101/255, 180/255, 162/255);
##D col_fiv <- rgb(51/255, 106/255, 144/255);
##D stackedbar_colours <- c(col_one, col_two, col_thr, col_fou, col_fiv, 'orchid4');
##D stacked_data_labels <- c('C>A/G>T','C>T/G>A','C>G/G>C','T>A/A>T','T>G/A>C', 'T>C/A>G');
##D 
##D stacked_data <- data.frame(
##D     values = c(patient$prop.CAGT, patient$prop.CTGA, patient$prop.CGGC, patient$prop.TAAT, 
##D         patient$prop.TGAC, patient$prop.TCAG), 
##D     divisions = rep(rownames(patient), 6),
##D     group = rep(stacked_data_labels, each = 58)
##D     );
##D 
##D # Generate stacked barplot
##D stacked_barplot <- create.barplot(
##D     formula = values ~ divisions,
##D     data = stacked_data,
##D     groups = stacked_data$group,
##D     stack = TRUE,
##D     col = stackedbar_colours,
##D     border.col = 'white'
##D     );
##D 
##D # barchart legends
##D stackedbar_legend <- list(
##D     legend = list(
##D         colours = rev(stackedbar_colours),
##D         labels = rev(stacked_data_labels),
##D         border = 'white'
##D         )
##D     );
##D 
##D groupedbar_legend <- list(
##D     legend = list(
##D         colours = groupedbar_colours,
##D         labels = c('CNA','SNV'),
##D         border = 'white'
##D         )
##D     );
##D 
##D groupedbar_legend.grob <- legend.grob(
##D     legends = groupedbar_legend,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7
##D     );
##D 
##D stackedbar_legend.grob <- legend.grob(
##D     legends = stackedbar_legend,
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
##D     main = 'Medians',
##D     centers = segplot.data$median,
##D     pch = 15
##D     );
##D 
##D # Create multiplot
##D plots <- list(covariates, dotmap, segplot, stacked_barplot, grouped_barplot);
##D 
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Complex.tiff'),
##D     main = 'Complex',
##D     # These dimensions make the plot look much more proportional
##D     width = 12,
##D     height = 8,
##D     plot.objects = plots,
##D     panel.heights = c(0.2, 0.2, 1, 0.1),
##D     panel.widths = c(1,0.1),
##D     plot.layout = c(2, 4),
##D     layout.skip = c(FALSE,TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,TRUE),
##D     xaxis.lab = list(
##D         NULL,
##D         NULL,
##D         seq(0,14,2),
##D         NULL,
##D         NULL),
##D     yaxis.lab = list(
##D         c('Sex','Stage','MSI'),
##D         rownames(SNV)[1:15],
##D         NULL,
##D         seq(0.0,1.0,0.2),
##D         seq(0,16,4)
##D         ),
##D     x.spacing = -0.5,
##D     y.spacing = -1.5,
##D     xaxis.cex = 0.7,
##D     yaxis.cex = 0.7,
##D     xat = list(
##D         NULL,
##D         NULL,
##D         seq(0,10,2.5),
##D         NULL,
##D         NULL
##D         ),
##D     yat = list(
##D         seq(1,3,1),
##D         seq(1,15,1),
##D         NULL,
##D         seq(0.0,1.0,0.2),
##D         seq(0,16,4)
##D         ),
##D     ylab.label = c( 'Mutation', 'Proportion','\t','\t','\t','\t','\t'),
##D     ylab.cex = 0.7,
##D     xlab.cex = 0.7,
##D     xlab.to.xaxis.padding = 2,
##D     key.bottom.padding = 5,
##D     bottom.padding = 5,
##D     right.padding = 8,
##D     legend = list(
##D         bottom = list(
##D             x = 0.10,
##D             y = 0.50,
##D             fun = cov_legend.grob
##D             ),
##D         inside = list(
##D             x = 0.91,
##D             y = 0.96,
##D             fun = groupedbar_legend.grob
##D             ),
##D         inside = list(
##D             x = 0.91,
##D             y = 0.86,
##D             fun = stackedbar_legend.grob
##D             ),
##D         left = list(
##D             fun = dotmap_legend.grob,
##D             args = list(
##D                 key = list(
##D                     points = list(
##D                         pch = c(15,15,19,19)
##D                         )
##D                     )
##D                 )
##D             )
##D         ),
##D     print.new.legend = TRUE
##D     );
##D 
##D # Nature style
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Nature_style.tiff'),
##D     plot.objects = list(simple.heatmap, simple.boxplot),
##D     main = "Nature style",
##D     ylab.padding = 7,
##D     xaxis.cex = 0.7,
##D     yaxis.cex = 0.7,
##D 
##D     # set style to Nature 
##D     style = 'Nature',
##D     
##D     # demonstrating how to italicize character variables
##D     ylab.label = c(expression(paste('italicized ', italic('a'))), 
##D     expression(paste('italicized ', italic('b')))),
##D   
##D     # demonstrating how to create en-dashes
##D     xlab.label = c(expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3)))
##D     );
##D 
##D 
##D # Create a multiplot with a heatmap, key like legend and barplot
##D 
##D # First create a heatmap object
##D simple.heatmap <- create.heatmap(patient[, 4:6],
##D     clustering.method = 'none',
##D     print.colour.key = FALSE,
##D     scale=TRUE,
##D     same.as.matrix = FALSE,
##D     colour.scheme = c('gray0','grey100'),
##D     fill.colour = 'grey95'
##D );
##D 
##D  
##D # and a simple bar plot
##D pvals <- data.frame(
##D         order = c(1:3),
##D         pvalue = -log10(c(0.0004, 0.045, 0.0001)),
##D         stringsAsFactors = FALSE
##D         )
##D #create bar plot
##D simple.bar <- create.barplot(
##D         formula = order ~ rev(pvalue),
##D         data = pvals,
##D         xlimits = c(0,5),
##D         plot.horizontal=TRUE
##D         );
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
##D     print.colour.key = FALSE
##D     );
##D covariates2 <- create.heatmap(
##D     x = patient[4],
##D     clustering.method = 'none',
##D     colour.scheme = c("#00007F", "#007FFF"),
##D     row.colour = 'white',
##D     col.colour = 'white',
##D     grid.row = TRUE,
##D     grid.col = TRUE,
##D     yaxis.tck = 0,
##D     print.colour.key = FALSE
##D     );
##D 
##D cov_legends <- list(
##D     legend = list(
##D         colours = c("white", "black"),
##D         labels = c('0','2'),
##D         border = 'grey',
##D         title = 'Tumour Mass (kg)',
##D         continuous = TRUE,
##D 	height = 3
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
##D 	continuous = TRUE,
##D 	height = 2,
##D         width = 3,
##D 	angle = -90,
##D 	tck = 1,
##D 	tck.number = 2,
##D 	at = c(0,100)
##D         )
##D     );
##D 
##D cov_legend.grob <- legend.grob(
##D     legends = cov_legends,
##D     title.just = 'left',
##D     label.cex = 0.7,
##D     title.cex = 0.7
##D     );
##D 
##D # Now bring it was together using multiplot
##D create.multiplot(
##D     main = 'multiplot with colour key legend',
##D     main.cex = 1,
##D     filename = paste0(tempdir(),"/MultiPlot_With_ColorKey_Legend.tiff"),
##D     plot.objects = list(covariates, covariates2, simple.heatmap, simple.bar),
##D     panel.heights = c(1,0.1,0.35),
##D     panel.widths = c(1,0.25),
##D     plot.layout = c(2,3),
##D     layout.skip = c(FALSE, TRUE, FALSE, TRUE,FALSE,FALSE),
##D     xaxis.alternating = 1,
##D     # Set some of the yat to NULL to let R figure it out
##D     yaxis.lab = list(
##D         c('Sex','Stage','MSI'),
##D         NULL,
##D 	c('one','two','three'),
##D         NULL
##D         ),
##D     xaxis.lab = list(
##D         NULL,
##D         NULL,
##D 	NULL,
##D         seq(0,5,1)
##D     ),
##D     xat = list(
##D         NULL,
##D         NULL,
##D 	NULL,
##D         seq(0,5,1)
##D     ),
##D     yaxis.tck = 0,
##D     xlab.to.xaxis.padding = 0,
##D     yaxis.cex = 0.5,
##D     xaxis.cex = 0.5,
##D     xlab.cex = 0.75,
##D     ylab.cex = 0.75,
##D     xlab.label = c('\t', 'samples', '\t', '    -log10 pval'),
##D     ylab.label = c("", "Test", "","CAGT",  "covariates"),
##D     y.spacing = 0,
##D     x.spacing = 0,
##D     legend = list(
##D         left = list(
##D             x = 0.10,
##D             y = 0.50,
##D             fun = cov_legend.grob
##D             )
##D         ),
##D     left.padding = 2.5,
##D     # This parameter must be set for the legend to appear
##D     print.new.legend = TRUE,
##D     );
##D 
##D BarPlotDataRetLabels <- data.frame(x = c("test1","test2","test3","test4"), 
##D 				   y = c(10000,13000,12000,6700))
##D HeatMapDataRetLabels <- matrix(nrow = 4, ncol = 4, data = rnorm(16,1,1))
##D 
##D bpRet <- create.barplot(
##D 	formula = y~x, 
##D 	data = BarPlotDataRetLabels, 
##D 	xaxis.lab = NULL, 
##D 	xat = 0
##D 	);
##D hmRet <- create.heatmap(
##D 	x= HeatMapDataRetLabels, 
##D 	yaxis.lab = c("Gene 1", "Gene 2", "Gene 3", "Gene 4"), 
##D 	yat = c(1,2,3,4), 
##D 	clustering.method = 'none'
##D 	);
##D 
##D create.multiplot(
##D 	filename = paste0(tempdir(),"/Multiplot_RetrievePlotLabels.tiff"),
##D 	plot.objects = list(hmRet,bpRet,bpRet), 
##D 	print.new.legend = TRUE,
##D 	xlab.label = c('Samples'),
##D 	ylab.padding = 12,
##D 	y.spacing = c(0,0),
##D 	panel.heights = c(0.25,1,0.25),
##D 	plot.labels.to.retrieve = c(1,2,3)
##D 	);
##D 
##D 
##D create.multiplot(
##D     filename = paste0(tempdir(),'/Multiplot_Retrieve_Specefic_Labels.tiff'),
##D         plot.objects = list(simple.heatmap, simple.boxplot),
##D         main = "Simple",
##D         xlab.label = c("Patient Group"),
##D 	xaxis.labels = c("1","Drug Regimen"),
##D         # The plotting function throws an error if this is not included
##D         ylab.label = c("Sugar Level", "Drug Regimen"),
##D         ylab.padding = 7,
##D         # Parameters set in the multiplot will override settings in individual plots
##D         xaxis.cex = 0.7,
##D         yaxis.cex = 0.7,
##D 	yaxis.labels = c(NA,NA),
##D 	xat = list(TRUE,TRUE),
##D 	yat = list(TRUE,TRUE),
##D 	plot.labels.to.retrieve = c(1),
##D 	xlimits = list(NULL,c("A","B","C")),
##D 	ylimits = list(NULL,c(-3,10))
##D         );
##D         
##D # Dendrogram provided
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
##D simple.boxplot <- create.boxplot(
##D     formula = x ~ y,
##D     data = simple.data,
##D     col = 'lightgrey'
##D     );
##D 
##D simple.heatmap <- create.heatmap(
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
##D legend <- legend.grob(
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
##D     title.just = 'left'
##D     );
##D create.multiplot(
##D         filename = paste0(tempdir(),"/MultiPlot_getDendrograms.tiff"),
##D         plot.objects = list(simple.heatmap, simple.boxplot),
##D         main = "Simple",
##D         xlab.label = c("Patient Group"),
##D 	y.spacing = 3,
##D         # The plotting function throws an error if this is not included
##D         ylab.label = c("Sugar Level", "Drug Regimen"),
##D         ylab.padding = 7,
##D         # Parameters set in the multiplot will override settings in individual plots
##D         xaxis.cex = 0.7,
##D         yaxis.cex = 0.7,
##D 	yaxis.lab = list(
##D 		c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20),
##D 		c(-2,-1,0,1,2,3,4,5)
##D 		),
##D 	xaxis.lab = list(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, 16,17,18,19,20),c(1,2,3)),
##D 	xaxis.rot = 45,
##D 	xaxis.rot.top = 90,
##D     	legend = list(right = list(fun = legend)),
##D 	print.new.legend = TRUE,
##D 	get.dendrogram.from = 1, 
##D 	dendrogram.right.size = 0.40, dendrogram.right.x = 29, dendrogram.right.y = 67,
##D 	dendrogram.top.size = 1, dendrogram.top.x = 110, dendrogram.top.y = -180
##D         );
## End(Not run)



