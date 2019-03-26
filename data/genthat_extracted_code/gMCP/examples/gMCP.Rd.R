library(gMCP)


### Name: gMCP
### Title: Graph based Multiple Comparison Procedures
### Aliases: gMCP
### Keywords: graphs htest

### ** Examples



g <- BonferroniHolm(5)
gMCP(g, pvalues=c(0.01, 0.02, 0.04, 0.04, 0.7))
# Simple Bonferroni with empty graph:
g2 <- matrix2graph(matrix(0, nrow=5, ncol=5))
gMCP(g2, pvalues=c(0.01, 0.02, 0.04, 0.04, 0.7))
# With 'upscale=TRUE' equal to BonferroniHolm:
gMCP(g2, pvalues=c(0.01, 0.02, 0.04, 0.04, 0.7), upscale=TRUE)

# Entangled graphs:
g3 <- Entangled2Maurer2012()
gMCP(g3, pvalues=c(0.01, 0.02, 0.04, 0.04, 0.7), correlation=diag(5))




