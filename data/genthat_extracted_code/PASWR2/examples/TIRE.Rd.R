library(PASWR2)


### Name: TIRE
### Title: Stopping Distance
### Aliases: TIRE
### Keywords: datasets

### ** Examples

ggplot(data = TIRE, aes(x = reorder(tire, stopdist, FUN = median), y = stopdist, 
fill = tire)) + geom_boxplot() + guides(fill = FALSE) + 
labs(y = "Stopping distance in feet", x = "Tire Brand") + scale_fill_brewer()
summary(aov(stopdist ~ tire, data = TIRE))
p <- ggplot(data = TIRE, aes(x = reorder(tire, stopdist, FUN = mean), 
y = stopdist, fill = tire))
p + geom_boxplot(width = 0.6) + geom_dotplot(binaxis = "y", stackdir = "center",
binwidth = 2) + guides(fill = FALSE) + scale_fill_brewer() + 
stat_summary(fun.y = mean, geom = "point", fill = "black", shape = 23, size = 3) +
labs(x = "Tire Brand", y = "Stopping distance in feet")



