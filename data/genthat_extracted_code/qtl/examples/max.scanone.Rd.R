library(qtl)


### Name: max.scanone
### Title: Maximum peak in genome scan
### Aliases: max.scanone
### Keywords: print

### ** Examples

data(listeria)
## Don't show: 
listeria <- subset(listeria,chr=c(5,13),ind=!is.na(listeria$pheno[,1]))
## End(Don't show)
listeria <- calc.genoprob(listeria, step=2.5)
out <- scanone(listeria, model="2part", upper=TRUE)
# Maximum peak for LOD(p,mu)
max(out)

# Maximum peak for LOD(p,mu) on chr 5
max(out,chr=5)

# Maximum peak for LOD(p,mu) on chromosomes other than chr 13
max(out,chr="-13")

# Maximum peak for LOD(p)
max(out, lodcolumn=2)

# Maximum peak for LOD(mu)
max(out, lodcolumn=3)



