library(tmod)


### Name: tmodSummary
### Title: Create a summary of multiple tmod analyses
### Aliases: tmodSummary

### ** Examples

data(Egambia)
E <- Egambia[,-c(1:3)]
pca <- prcomp(t(E), scale.=TRUE)

# Calculate enrichment for each component
gs   <- Egambia$GENE_SYMBOL
gn.f <- function(r) {
    tmodCERNOtest(gs[order(abs(r), 
                decreasing=TRUE)], 
                qval=0.01)
}
x <- apply(pca$rotation, 2, gn.f)
tmodSummary(x)



