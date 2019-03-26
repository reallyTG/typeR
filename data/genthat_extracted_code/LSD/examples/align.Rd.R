library(LSD)


### Name: align
### Title: Visualize two-dimensional data in a color encoded fashion
### Aliases: LSD.align align
### Keywords: alignment, sequence

### ** Examples

data(seqs)
colpal = c("A" = "darkgreen","C" = "darkblue","G" = "yellow","T" = "darkred")
align(seqs,colpal = colpal,label = TRUE,main = "DNA sequences")

data(homer)
colpal = c("white","black","yellow","wheat3")
align(homer,colpal = colpal,main = "D'OH!",asp = 1,axes = FALSE)



