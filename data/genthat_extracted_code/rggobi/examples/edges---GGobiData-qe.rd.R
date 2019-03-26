library(rggobi)


### Name: "edges<-.GGobiData"
### Title: Set edges
### Aliases: edges<-.GGobiData
### Keywords: manip

### ** Examples

if (interactive()) {
cc<-cor(t(swiss),use="p", method="s") 
ccd<-sqrt(2*(1-cc)) 
a <- which(lower.tri(ccd), arr.ind=TRUE)
src <- row.names(swiss)[a[,2]]
dest <- row.names(swiss)[a[,1]] 
weight <- as.vector(as.dist(ccd))
gg <- ggobi(swiss)
gg$cor <- data.frame(weight)
edges(gg$cor) <- cbind(src, dest)
edges(gg$cor)
edges(gg$cor) <- NULL}


