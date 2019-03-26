library(TSMining)


### Name: Func.visual.MultiMotif
### Title: A function to prepare the data for the visualization of
###   multivariate motifs discovered
### Aliases: Func.visual.MultiMotif

### ** Examples

data(test)
#Perform univariate motif discovery
res.1 <- Func.motif(ts = test$TS1, global.norm = TRUE, local.norm = FALSE,
window.size = 10, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
res.2 <- Func.motif(ts = test$TS2, global.norm = TRUE, local.norm = FALSE,
window.size = 20, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
res.multi <- Func.motif.multivariate(motif.list = list(res.1$Indices, res.2$Indices),
window.sizes = c(10,20), alpha = .8)
#Use the function to prepare the data frame for visualizing the first multivariate motifs identified
data.multi <- Func.visual.MultiMotif(data = test, multi.motifs = res.multi, index = 1)
#Make the plot using ggplot2
library(ggplot2)
ggplot(data = data.multi) +
 geom_line(aes(x = T, y = X)) +
 geom_point(aes(x = T, y = X, col=Lab, shape=Lab)) + facet_grid(Facet~.)



