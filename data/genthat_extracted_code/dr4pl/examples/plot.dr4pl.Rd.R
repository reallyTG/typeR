library(dr4pl)


### Name: plot.dr4pl
### Title: Make a plot of a 4PL model curve and data
### Aliases: plot.dr4pl

### ** Examples

## Not run: 
##D dr4pl.1 <- dr4pl(Response ~ Dose, data = sample_data_1)
##D 
##D plot(dr4pl.1)
##D 
##D ## Able to further edit plots.
##D library(ggplot2) #needed to change color to green
##D dr4pl.1 <- dr4pl(Response ~ Dose,
##D                         data = sample_data_1,
##D                         text.title = "Sample Data Plot")
##D 
##D a <- plot(dr4pl.1)
##D a + geom_point(color = "green", size = 5)
##D 
##D ## Bring attention to outliers using parameter indices.outlier.
##D dr4pl.3 <- dr4pl(Response ~ Dose,
##D                  data = drc_error_3,
##D                  method.init = "Mead",
##D                  method.robust = "absolute")
##D plot(dr4pl.3, indices.outlier = c(90, 101))
##D 
##D ## Change the plot title default with parameter text.title.
##D dr4pl.1 <- dr4pl::dr4pl(Response ~ Dose,
##D                         data = sample_data_1)
##D plot(dr4pl.1, text.title = "My New Dose Response plot")
##D 
##D ##Change the labels of the x and y axis to your need
##D library(drc)  # Needed to load 'decontaminants' data set
##D data.hpc <- subset(decontaminants, group %in% "hpc")
##D dr4pl.hpc <- dr4pl(count~conc, data = data.hpc)
##D plot(dr4pl.hpc,
##D      text.title = "hpc Decontaminants Plot",
##D      text.x = "Concentration",
##D      text.y = "Count")
## End(Not run)




