library(TRSbook)


### Name: barchart
### Title: Bar charts
### Aliases: barchart

### ** Examples

data(NUTRIELDERLY)
attach(NUTRIELDERLY)
fat <- as.factor(fat)
col <- c("yellow","yellow2","sandybrown","orange",
   "darkolivegreen","green","olivedrab2","green4")
barchart(fat,col,pareto=TRUE)
detach(NUTRIELDERLY)



