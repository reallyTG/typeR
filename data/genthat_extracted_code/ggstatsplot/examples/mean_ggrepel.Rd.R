library(ggstatsplot)


### Name: mean_ggrepel
### Title: Adding labels for mean values.
### Aliases: mean_ggrepel
### Keywords: internal

### ** Examples


## Not run: 
##D # this internal function may not have much utility outside of the package
##D set.seed(123)
##D library(ggplot2)
##D 
##D # make a plot
##D p <- ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
##D   geom_boxplot()
##D 
##D # get a dataframe with means
##D mean_dat <- ggstatsplot:::mean_labeller(
##D   data = iris,
##D   x = Species,
##D   y = Sepal.Length,
##D   mean.ci = TRUE,
##D   k = 3
##D )
##D 
##D # add means
##D ggstatsplot:::mean_ggrepel(
##D   plot = p,
##D   mean.data = mean_dat,
##D   mean.color = "darkgreen"
##D )
## End(Not run)



