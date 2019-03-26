library(BoutrosLab.plotting.general)


### Name: get.corr.key
### Title: Correlation Key
### Aliases: get.corr.key
### Keywords: xyplot

### ** Examples


## Not run: 
##D # create some temporary data
##D tmp.data <- data.frame(
##D     x = c(
##D         runif(n = 15, min =  0, max =  20),
##D         runif(n = 15, min = 80, max = 100),
##D         runif(n = 70, min =  0, max = 100)
##D         ),
##D     y = c(
##D         runif(n = 15, min =  0, max =  20),
##D         runif(n = 15, min = 80, max = 100),
##D         runif(n = 70, min =  0, max = 100)
##D         )
##D     );
##D 
##D # a simple scatterplot with correlation key
##D BoutrosLab.plotting.general::create.scatterplot(
##D     formula = y ~ x,
##D     data = tmp.data,
##D     filename = paste0(tempdir(),'/get.corr.key-scatterplot.tiff'),
##D     xlab.label = 'X Axis Title',
##D     ylab.label = 'Y Axis Title',
##D     xlimits = c(0,100),
##D     ylimits = c(0,100),
##D     xat = seq(0,100,25),
##D     yat = seq(0,100,25),
##D     add.axes = FALSE,
##D     key = BoutrosLab.plotting.general::get.corr.key(
##D         tmp.data$y,
##D         tmp.data$x,
##D         label.items = c('spearman', 'spearman.p', 'kendall', 'beta1', 'beta1.p')
##D         )
##D     );
##D 
##D # compare beta1 vs a robust estimate of the slope
##D 
##D # add an outlier
##D tmp.data <- rbind(tmp.data, c(2000,100));
##D 
##D BoutrosLab.plotting.general::create.scatterplot(
##D     formula = y ~ x,
##D     data = tmp.data,
##D     filename = paste0(tempdir(),'/get.corr.key.robust-scatterplot.tiff'),
##D     xlab.label = 'X Axis Title',
##D     ylab.label = 'Y Axis Title',
##D     xlimits = c(0,100),
##D     ylimits = c(0,100),
##D     xat = seq(0,100,25),
##D     yat = seq(0,100,25),
##D     add.axes = FALSE,
##D     key = BoutrosLab.plotting.general::get.corr.key(
##D         tmp.data$y,
##D         tmp.data$x,
##D         label.items = c('beta1', 'beta1.robust','beta1.p','beta1.robust.p')
##D         )
##D     );
## End(Not run)
# see create.scatterplot for an example of creating multiple keys using legends



