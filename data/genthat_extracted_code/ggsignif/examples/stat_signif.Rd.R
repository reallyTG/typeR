library(ggsignif)


### Name: stat_signif
### Title: Create significance layer
### Aliases: stat_signif geom_signif

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(ggsignif)
##D ggplot(mpg, aes(class, hwy)) +
##D  geom_boxplot() +
##D  geom_signif(comparisons = list(c("compact", "pickup"),
##D                                 c("subcompact", "suv")))
##D ggplot(mpg, aes(class, hwy)) +
##D  geom_boxplot() +
##D  geom_signif(comparisons = list(c("compact", "pickup"),
##D                                 c("subcompact", "suv")),
##D              map_signif_level=function(p)sprintf("p = %.2g", p))
##D 
##D ggplot(mpg, aes(class, hwy)) +
##D   geom_boxplot() +
##D   geom_signif(annotations = c("First", "Second"),
##D               y_position = c(30, 40), xmin=c(4,1), xmax=c(5,3))
## End(Not run)




