library(linLIR)


### Name: idf
### Title: Interval data frame
### Aliases: idf.create summary.idf plot.idf

### ** Examples

data('toy.smps')
toy.idf <- idf.create(toy.smps, var.labels=c("x","y"))

summary(toy.idf)

plot(toy.idf, typ="draft", k.x=10, k.y=10, p.cex=1.5, y.las=1, y.adj=6) 
plot(toy.idf, typ="draft", k.x=10, k.y=10, x.adj=0.7, y.las=1, y.adj=6, y.padj=-3)
plot(toy.idf, k.x=10, k.y=10, x.adj=0.7, x.padj=4, y.adj=0.7, y.padj=-4)

data('pm10')
pm.idf <- idf.create(pm10)

summary(pm.idf)

plot(pm.idf, typ="draft", k.x=10, k.y=20, p.cex=0.35, x.adj=0.5, x.padj=4, y.las=0, y.adj=0.5, y.padj=-4, x.lab="temperature", y.lab="particulate matter concentration")



