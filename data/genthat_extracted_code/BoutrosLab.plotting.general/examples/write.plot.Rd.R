library(BoutrosLab.plotting.general)


### Name: write.plot
### Title: Simplifies plotting by standardizing and centralizing all
###   output-handling
### Aliases: write.plot
### Keywords: iplot

### ** Examples


## Not run: 
##D set.seed(253647)
##D # create test data
##D tmp.data <- data.frame(
##D     x = c(
##D         runif(n = 150, min =  0, max = 20),
##D         runif(n = 150, min = 40, max = 60),
##D         runif(n = 700, min =  0, max = 40)
##D         ),
##D     y = c(
##D         runif(n = 150, min =  0, max =  20),
##D         runif(n = 150, min = 40, max = 60),
##D         runif(n = 700, min =  0, max = 40)
##D         )
##D     );
##D 
##D main.plot <- create.densityplot(
##D     x = list(
##D         X = tmp.data$x,
##D         Y = tmp.data$y
##D         ),
##D     xlab.label = 'X Axis Title',
##D     ylab.label = 'Y Axis Title',
##D     xlimits = c(-50,150),
##D     ylimits = c(0,0.03),   
##D     xat = seq(-50,150,50),
##D     yat = seq(0,0.03,0.005),
##D     description = 'Image description goes here'
##D     );
##D 
##D secondary.plot <- create.densityplot(
##D     x = list(
##D         X = tmp.data$x,
##D         Y = tmp.data$y
##D         ),
##D     xlab.label = '',
##D     ylab.label = '',
##D     xlimits = c(50,75),
##D     ylimits = c(0,0.015),   
##D     xat = seq(0,150,10),
##D     yat = seq(0,0.015,0.005),
##D     xaxis.tck = 0,
##D     description = 'Image description goes here'
##D     );
##D 
##D write.plot(
##D     filename = paste0(tempdir(),'/write_plot_example.tiff'),
##D     trellis.object = main.plot,
##D     additional.trellis.objects = list(secondary.plot),
##D     additional.trellis.locations = list(
##D         xleft = 0.6,
##D         ybottom = 0.5,
##D         xright =0.97,
##D         ytop = 0.9
##D         ),
##D     resolution = 50 # Lowering resolution decreases file size
##D     );
## End(Not run)



