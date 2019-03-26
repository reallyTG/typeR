library(Tmisc)


### Name: datasaurus
### Title: Datasaurus Dozen
### Aliases: datasaurus
### Keywords: datasets

### ** Examples

## Not run: 
##D library(dplyr)
##D datasaurus %>% 
##D   group_by(set) %>% 
##D   summarize(mean(x), mean(y), sd(x), sd(y), cor(x, y))
##D library(ggplot2)
##D ggplot(datasaurus, aes(x,y)) + 
##D   geom_point() + 
##D   geom_smooth(method="lm") + 
##D   facet_wrap(~set)
## End(Not run)



