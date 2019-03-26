library(munsell)


### Name: chroma_slice
### Title: Plot all colours with the same chroma
### Aliases: chroma_slice

### ** Examples

chroma_slice(2)
chroma_slice(18)
# Maybe want to delete text and add axis instead
p <- chroma_slice(18)
p$layers[[2]] <- NULL # remove text layer
p + ggplot2::theme(axis.text = ggplot2::element_text(), 
   axis.text.x = ggplot2::element_text(angle = 90, hjust = 1))
# all values 
## Not run: chroma_slice(seq(0, 38, by = 2))



