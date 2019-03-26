library(TSMining)


### Name: Func.visual.SingleMotif
### Title: A function to prepare the dataset for visualizing the univaraite
###   motifs discovered
### Aliases: Func.visual.SingleMotif

### ** Examples

data(test)
#Perform univariate motif discovery for the first dimension data in the example data
res.1 <- Func.motif(ts = test$TS1, global.norm = TRUE, local.norm = FALSE,
window.size = 10, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
data.vis <- Func.visual.SingleMotif(single.ts=test$TS1, window.size=10, motif.indices=res.1$Indices)
#To visualize general information of motifs discovered on the whole time series
library(ggplot2)
ggplot(data = data.vis$data.1) +
 geom_line(aes(x = 1:dim(data.vis$data.1)[1], y = X)) +
 geom_point(aes(x = 1:dim(data.vis$data.1)[1], y = X, color=Y))
#To visualize the detailed information of the 1st motif
ggplot(data = data.vis$data.2[[1]]) + geom_line(aes(x = Time, y = Value, linetype=Instance))



