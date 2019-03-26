library(SciViews)


### Name: panels.diag
### Title: More univariate panel plots.
### Aliases: panels.diag panel_boxplot panel.boxplot panel_density
###   panel.density panel_hist panel.hist panel_qqnorm panel.qqnorm
### Keywords: aplot

### ** Examples

# Example of scatterplot matrices with custom plots on the diagonal
# Boxplots
pairs(trees, panel = panel_smooth, diag.panel = panel_boxplot)
pairs(trees, diag.panel = panel_boxplot, box.col = "gray")
# Densities
pairs(trees, panel = panel_smooth, diag.panel = panel_density)
pairs(trees, diag.panel = panel_density, line.col = "red", adjust = 0.5)
# Histograms
pairs(trees, panel = panel_smooth, diag.panel = panel_hist)
pairs(trees, diag.panel = panel_hist, hist.col = "gray", breaks = "Scott")
# QQ-plots against Normal theoretical distribution
pairs(trees, panel = panel_smooth, diag.panel = panel_qqnorm)
pairs(trees, diag.panel = panel_qqnorm, qqline.col = 2, qq.cex = .5, qq.pch = 3)



