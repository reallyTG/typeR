library(BoutrosLab.plotting.general)


### Name: thousands.split
### Title: Divide strings into groups of thousands
### Aliases: thousands.split

### ** Examples


## Not run: 
##D thousands.split(2344)
##D 
##D nums = c(1,2,34343,56565645645,676756,3434)
##D 
##D thousands.split(nums)
##D 
##D scatter.data <- data.frame(
##D     sample.one = microarray[1:800,1],
##D     sample.two = microarray[1:800,2],
##D     chr = microarray$Chr[1:800]
##D     );
##D 
##D create.scatterplot(
##D     filename = paste0(tempdir(),"/Test_Divide_Thousands.tiff"),
##D     formula = sample.two ~ sample.one,
##D     data = scatter.data,
##D     main = 'Axes & Labels',
##D     # Axes and labels
##D     xlab.label = colnames(microarray[1]),
##D     ylab.label = colnames(microarray[2]),
##D     yaxis.lab = thousands.split(c(1,2323,4545,567676,454,76767678678,89,787)),
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
## End(Not run)



