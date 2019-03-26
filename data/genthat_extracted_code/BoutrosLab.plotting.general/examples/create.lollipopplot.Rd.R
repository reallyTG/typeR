library(BoutrosLab.plotting.general)


### Name: create.lollipopplot
### Title: Make a lollipopplot
### Aliases: create.lollipopplot
### Keywords: hplot

### ** Examples

## Not run: 
##D set.seed(12345);
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



