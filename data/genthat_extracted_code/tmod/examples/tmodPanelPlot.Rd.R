library(tmod)


### Name: tmodPanelPlot
### Title: Plot a summary of multiple tmod analyses
### Aliases: tmodPanelPlot

### ** Examples

data(Egambia)
E <- Egambia[,-c(1:3)]
pca <- prcomp(t(E), scale.=TRUE)

# Calculate enrichment for first 5 PCs
gs   <- Egambia$GENE_SYMBOL
gn.f <- function(r) {
    o <- order(abs(r), decreasing=TRUE)
    tmodCERNOtest(gs[o], 
                qval=0.01)
}
x <- apply(pca$rotation[,3:4], 2, gn.f)
tmodPanelPlot(x, text.cex=0.7)



