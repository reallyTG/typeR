library(BoutrosLab.plotting.general)


### Name: create.colourkey
### Title: Create Colourkey
### Aliases: create.colourkey create.colorkey
### Keywords: xyplot

### ** Examples


## Not run: 
##D set.seed(1234567890);
##D x <- outer(-5:5, -5:5, '*') + matrix(nrow = 11, ncol = 11, data = runif(11 * 11));
##D colnames(x) <- paste('col', 1:11, sep = '-');
##D rownames(x) <- paste('row', 1:11, sep = '-');
##D 
##D y <- as.data.frame(x);
##D y$mean <- apply(x,1,mean);
##D 
##D # example of a simple multiplot with colourkey
##D heatmap1 <- create.heatmap(
##D     x = t(x),
##D     filename = NULL,
##D     clustering.method = 'none',
##D     scale.data = FALSE,
##D     yaxis.lab = NA,
##D     print.colour.key = FALSE,
##D     colour.scheme = c('chartreuse3', 'white', 'blue'),
##D     at = seq(-25, 25, 0.01)
##D     );
##D 
##D barplot1 <- create.barplot(
##D     1:nrow(y) ~ mean,
##D     y,
##D     plot.horizontal = TRUE
##D     );
##D 
##D create.multiplot(
##D     plot.objects = list(heatmap1, barplot1),
##D     filename = paste0(tempdir(),'/multiplot_with_colourkey.tiff'),
##D     plot.layout = c(2,1),
##D     panel.widths = c(2,1),
##D     yat = list(1:nrow(y), NULL),
##D     yaxis.labels = rownames(y),
##D     xlimits = list(NULL, c(0,1)),
##D     xat = list(NULL, seq(0,1,0.5)),
##D     xaxis.labels = list(NULL, seq(0,1,0.5)),
##D     x.spacing = 0,
##D     print.new.legend = TRUE,
##D     legend = list(
##D         inside = list(
##D             fun = BoutrosLab.plotting.general::create.colourkey(
##D                 x = x,
##D                 colour.scheme = c('chartreuse3', 'white', 'blue'),
##D                 at = seq(-25, 25, 0.01),
##D                 colourkey.labels.at = c(-25, 0, 25),
##D                 placement = viewport(just = 'left', x = 0.55, y = -0.55, width = 0.5)
##D                 )
##D             )
##D         ),
##D     bottom.padding = 4,
##D     width = 10,
##D     height = 8,
##D     resolution = 500
##D     );
## End(Not run)



