library(gginnards)


### Name: stat_debug_panel
### Title: Print to console data received by the compute panel function.
### Aliases: stat_debug_panel

### ** Examples

library(ggplot2)
my.df <- data.frame(x = rep(1:10, 2),
                    y = rep(c(1,2), c(10,10)),
                    group = rep(c("A","B"), c(10,10)))
ggplot(my.df, aes(x,y)) + geom_point() + stat_debug_panel()
ggplot(my.df, aes(x,y, colour = group)) + geom_point() + stat_debug_panel()
ggplot(my.df, aes(x,y)) + geom_point() + facet_wrap(~group) + stat_debug_panel()




