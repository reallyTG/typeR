library(Momocs)


### Name: plot_CV
### Title: Plots a cross-validation table as an heatmap
### Aliases: plot_CV plot_CV.default plot_CV.LDA

### ** Examples

ol <- LDA(PCA(opoly(olea, 5)), "domes")
# freq=FALSE inspired by Chitwood et al. New Phytol fig. 4
gg <- plot_CV(ol, freq=FALSE)
gg

# and you can tune the gg object wit regular ggplot2 syntax eg
gg + ggplot2::scale_color_discrete(h = c(120, 240))

# freq=TRUE
plot_CV(ol, freq=TRUE)



