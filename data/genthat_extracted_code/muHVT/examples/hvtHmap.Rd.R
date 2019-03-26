library(muHVT)


### Name: hvtHmap
### Title: hvtHmap
### Aliases: hvtHmap
### Keywords: hplot

### ** Examples

data(USArrests)
hvt.results <- list()
hvt.results <- HVT(USArrests, nclust = 6, depth = 1, quant.err = 0.2, 
                  projection.scale = 10, normalize = TRUE)
hvtHmap(hvt.results, USArrests, child.level = 1,hmap.cols = 'Murder', line.width = c(0.2),
color.vec = c('#141B41'),palette.color = 6)

hvt.results <- list()
hvt.results <- HVT(USArrests, nclust = 3, depth = 3, quant.err = 0.2, 
                  projection.scale = 10, normalize = TRUE)
hvtHmap(hvt.results, train_computers, child.level = 3,hmap.cols = 'quant_error', 
line.width = c(1.2,0.8,0.4),color.vec = c('#141B41','#0582CA','#8BA0B4'),palette.color = 6)



