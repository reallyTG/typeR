library(GA)


### Name: plot.ga-method
### Title: Plot of Genetic Algorithm search path
### Aliases: plot,ga-method plot.ga
### Keywords: methods hplot

### ** Examples

# See examples in help(ga)

# The following code shows how to obtain graphs using the 
# ggplot2 plotting system 
## Not run: 
##D GA <- ga(...)
##D out <- plot(GA)
##D library(reshape2)
##D df <- melt(out[,c(1:3,5)], id.var = "iter")
##D library(ggplot2)
##D ggplot(df, aes(x = iter, y = value, group = variable, colour = variable)) +
##D   xlab("Generation") +  ylab("Fitness values") +
##D   geom_point(aes(shape = variable)) + 
##D   geom_line(aes(lty = variable)) +
##D   scale_colour_brewer(palette = "Set1") +
##D   theme_bw() +
##D   theme(legend.title = element_blank())
## End(Not run)



