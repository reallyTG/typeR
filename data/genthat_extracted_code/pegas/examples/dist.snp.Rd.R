library(pegas)


### Name: dist.snp
### Title: Allelic Sharing Distance with SNPs
### Aliases: dist.snp dist.asd
### Keywords: manip multivariate cluster

### ** Examples

data(jaguar)
## ASD for micro-satellites:
d <- dist.asd(jaguar)
co <- rainbow(nlevels(jaguar$pop))
plot(nj(d), "u", tip.color = co[jaguar$pop], font = 2, lab4 = "a")
legend("topleft", legend = levels(jaguar$pop), text.col = co, text.font = 2)



