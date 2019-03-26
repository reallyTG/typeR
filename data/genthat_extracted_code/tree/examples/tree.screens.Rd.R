library(tree)


### Name: tree.screens
### Title: Split Screen for Plotting Trees
### Aliases: tree.screens
### Keywords: tree hplot

### ** Examples

data(fgl, package="MASS")
fgl.tr <- tree(type ~ ., fgl)
summary(fgl.tr)
plot(fgl.tr);  text(fgl.tr, all=TRUE, cex=0.5)
fgl.tr1 <- snip.tree(fgl.tr, node=c(108, 31, 26))
tree.screens()
plot(fgl.tr1)
tile.tree(fgl.tr1, fgl$type)
close.screen(all = TRUE)



