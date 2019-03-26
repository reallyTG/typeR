library(PASWR2)


### Name: checking.plots
### Title: Checking Plots
### Aliases: checking.plots
### Keywords: hplot

### ** Examples

mod.aov <- aov(stopdist ~ tire, data = TIRE)
checking.plots(mod.aov)
rm(mod.aov)

# Similar graphs using ggplot2
#
mod.aov <- aov(stopdist ~ tire, data = TIRE)
fortify(mod.aov)
# library(gridExtra) used to place all graphs on the same device
p1 <- ggplot(data = mod.aov, aes(x = 1:dim(fortify(mod.aov))[1], y = .stdresid, 
color = tire)) + geom_point() + labs(y = "Standardized Residuals", 
x = "Ordered Residuals") + geom_hline(yintercept = c(-3,-2, 2, 3), 
linetype = "dashed", col = "pink") + theme_bw()
p2 <- ggplot(data = mod.aov, aes(sample = .stdresid, color = tire)) +
stat_qq()  + geom_abline(intercept = 0, slope = 1, linetype = "dashed", col = "pink") + theme_bw()
p3 <- ggplot(data = mod.aov, aes(x = .fitted, y = .stdresid, color = tire)) + 
geom_point() + geom_hline(yintercept = 0, linetype = "dashed") + 
labs(y = "Standardized Residuals", x = "Fitted Values") + 
geom_hline(yintercept = c(-3, -2, 2, 3), linetype = "dashed", color = "pink") + 
theme_bw()
p1
p2
p3
multiplot(p1, p2, p3, cols = 1)
# Or use the following (not run) to get all graphs on the same device
# library(gridExtra)
# grid.arrange(p1, p2, p3, nrow=3)
rm(mod.aov, p1, p2, p3)




