library(heplots)


### Name: plot.boxM
### Title: Plot for Box's M test and generalizations
### Aliases: plot.boxM
### Keywords: hgraph

### ** Examples

# Iris data
res <- boxM(iris[, 1:4], iris[, "Species"])
plot(res, gplabel="Species")

# Skulls data
skulls.mod <- lm(cbind(mb, bh, bl, nh) ~ epoch, data=Skulls)
skulls.boxm <- boxM(skulls.mod)
plot(skulls.boxm, gplabel="Epoch")
plot(skulls.boxm, gplabel="Epoch", bias.adj=FALSE)

# other measures
 plot(skulls.boxm, which="product", gplabel="Epoch", xlim=c(10,14))
 plot(skulls.boxm, which="sum", gplabel="Epoch")
 plot(skulls.boxm, which="precision", gplabel="Epoch")
 plot(skulls.boxm, which="max", gplabel="Epoch")





