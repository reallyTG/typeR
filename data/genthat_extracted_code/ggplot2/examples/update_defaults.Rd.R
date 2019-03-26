library(ggplot2)


### Name: update_geom_defaults
### Title: Modify geom/stat aesthetic defaults for future plots
### Aliases: update_geom_defaults update_stat_defaults
### Keywords: internal

### ** Examples

update_geom_defaults("point", list(colour = "darkblue"))
ggplot(mtcars, aes(mpg, wt)) + geom_point()
update_geom_defaults("point", list(colour = "black"))



