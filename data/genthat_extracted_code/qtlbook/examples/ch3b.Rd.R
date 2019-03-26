library(qtlbook)


### Name: ch3b
### Title: Data with bad markers
### Aliases: ch3b
### Keywords: datasets

### ** Examples

data(ch3b)

thetab <- geno.table(ch3b)
plot(-log10(thetab[,ncol(thetab)]), ylab=expression(-log[10](P)))
thetab[thetab[,ncol(thetab)] < 1e-6,]



