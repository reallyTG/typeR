library(gtools)


### Name: unByteCode
### Title: Convert a Byte-Code Function to an Interpreted-Code Function
### Aliases: unByteCode unByteCodeAssign assignEdgewise
### Keywords: programming utilites

### ** Examples

data(badDend)
dist2 <- function(x) as.dist(1-cor(t(x), method="pearson"))
hclust1 <- function(x) hclust(x, method = "single")

distance <- dist2(badDend)
cluster  <- hclust1(distance)

dend <- as.dendrogram(cluster)

## Not run: 
##D     ## In R 2.3.0 and earlier crashes with a node stack overflow error
##D     plot(dend)
##D     ## Error in xy.coords(x, y, recycle = TRUE) : node stack overflow
## End(Not run)

## convert stats:::plotNode from byte-code to interpreted-code
unByteCodeAssign(stats:::plotNode)

# increase recursion limit
options("expressions"=5e4)

# now the function does not crash
plot(dend)



