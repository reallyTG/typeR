library(linLIR)


### Name: s.linlir
### Title: Simple linear Likelihood-based Imprecise Regression
### Aliases: s.linlir print.s.linlir summary.s.linlir plot.s.linlir

### ** Examples

data('toy.smps')
toy.idf <- idf.create(toy.smps, var.labels=c("x","y"))

test <- s.linlir(toy.idf, bet=0.5)
test

summary(test)

plot(test, typ="para", x.adj=0.7, y.las=1, y.adj=6, y.padj=-3)
plot(test, typ="func", pl.lrm=FALSE, x.adj=0.7, y.adj=0.7, y.padj=-3)
plot(test, typ="lrm", lrm.col="red", pl.band=TRUE, pl.dat=TRUE, pl.dat.typ="draft",k.x=10, k.y=10, y.las=1, y.adj=6)



