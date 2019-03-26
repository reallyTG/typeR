library(GA)


### Name: plot.gaisl-method
### Title: Plot of Islands Genetic Algorithm search path
### Aliases: plot,gaisl-method plot.gaisl
### Keywords: methods hplot

### ** Examples

# See examples in help(gaisl)

# The following code shows how to obtain graphs using the 
# ggplot2 plotting system 
## Not run: 
##D GA <- gaisl(...)
##D out <- plot(GA)
##D library(reshape2)
##D df <- melt(out, id.var = "iter")
##D library(ggplot2)
##D ggplot(df, aes(x = iter, y = value, group = variable, colour = variable)) +
##D   xlab("Generation") +  ylab("Fitness values") +
##D   geom_line(size = 0.8) +
##D   scale_colour_brewer(palette = "Paired") +
##D   theme_bw() +
##D   theme(legend.title = element_blank())
## End(Not run)



