library(bpca)


### Name: gge2003
### Title: A didactic matrix of genotypes (rows) and environments (columns)
### Aliases: gge2003
### Keywords: datasets

### ** Examples

##
## Example from YAN, W & KANG, M.S. GGE biplot analysis : a graphical tool
## for breeders, geneticists, and agronomists
##

data(gge2003)
bp <- bpca(t(gge2003), var.rb=TRUE)

as.dist(bp$var.rb)

dev.new(w=8, h=4)
op = par(no.readonly=TRUE)
par(mfrow=c(1,2))

plot(bpca(gge2003, var.pos=2),
     main='Columns as variables \n (var.pos=2)',
     var.col=1,
     obj.col=c(2:4, 2), obj.cex=.8)

plot(bpca(gge2003, var.pos=1),
     main='Rows as variables \n (var.pos=1)',
     var.col=1,
     obj.col=2:4, obj.cex=.8)

par(op)



