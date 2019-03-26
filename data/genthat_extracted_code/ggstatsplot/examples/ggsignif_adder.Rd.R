library(ggstatsplot)


### Name: ggsignif_adder
### Title: Adding 'geom_signif' to the plot.
### Aliases: ggsignif_adder
### Keywords: internal

### ** Examples

## Not run: 
##D library(ggplot2)
##D 
##D # data
##D df <- data.frame(x = iris$Species, y = iris$Sepal.Length)
##D 
##D # plot
##D p <- ggplot(df, aes(x, y)) + geom_boxplot()
##D 
##D # dataframe with pairwise comparison test results
##D df_pair <- ggstatsplot::pairwise_p(df, x, y)
##D 
##D # adding plot with
##D ggstatsplot:::ggsignif_adder(
##D   plot = p,
##D   df_pairwise = df_pair,
##D   data = df
##D )
## End(Not run)




