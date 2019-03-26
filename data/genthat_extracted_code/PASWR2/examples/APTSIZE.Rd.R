library(PASWR2)


### Name: APTSIZE
### Title: Apartment Size
### Aliases: APTSIZE
### Keywords: datasets

### ** Examples

p <- ggplot(data = APTSIZE, aes(x = location, y = size, fill = location)) + 
labs(x = "", y = "Apartment size (square meters)") + 
scale_x_discrete(breaks = c("Mendebaldea", "SanJorge"), 
labels =c("Mendebaldea", "San Jorge")) + scale_fill_brewer()
p + geom_boxplot()
# remove the legend
p + geom_boxplot() + guides(fill = FALSE)
# violin plot
p + geom_violin(scale = 'area') + guides(fill = FALSE)
p + geom_violin(scale = 'count') + guides(fill = FALSE)
p + geom_violin() + geom_boxplot(width = 0.15, fill = 'black') + guides(fill = FALSE) + 
stat_summary(fun.y = median, geom = "point", fill = "white", shape = 23, size = 3)
# dotplot
p + geom_dotplot(binaxis = "y", stackdir = "center", binwidth = 3) + 
guides(fill = FALSE)
p + geom_boxplot(width = 0.4) + geom_dotplot(binaxis = "y", stackdir = "center", 
binwidth = 3) + guides(fill = FALSE) + scale_fill_brewer(type = "qual", palette = 1)
# base graphics
boxplot(size ~ location, data = APTSIZE, col = c("red", "yellow"), 
ylab = "Apartment size (square meters)")



