library(PASWR2)


### Name: twoway.plots
### Title: Exploratory Graphs for Two Factor Designs
### Aliases: twoway.plots
### Keywords: hplot

### ** Examples

with(data = TIREWEAR, twoway.plots(wear, treat, block))
#################################
## Similar graphs with ggplot2 ##
#################################
p1 <- ggplot(data = TIREWEAR, aes(x = treat, y = wear, fill = treat)) +
geom_boxplot() + guides(fill = FALSE) + theme_bw()
p2 <- ggplot(data = TIREWEAR, aes(x = block, y = wear, fill = block)) +
geom_boxplot() + guides(fill = FALSE) + theme_bw() 
p3 <- ggplot(data = TIREWEAR, aes(x = treat, y = wear, color = block,
group = block)) + stat_summary(fun.y = mean, geom = "point", size = 4) + 
stat_summary(fun.y = mean, geom = "line") + theme_bw()
p4 <- ggplot(data = TIREWEAR, aes(x = treat, y = wear, color = treat)) + 
geom_boxplot() + facet_grid(. ~ block) +theme_bw()
p1
p2
p3
p4
## To get all plots on the same device use gridExtra (not run)
## library(gridExtra)
## grid.arrange(p1, p2, p3, p4, nrow=2)



