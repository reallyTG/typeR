library(gaston)


### Name: select.snps
### Title: Subsetting from a 'bed.matrix'
### Aliases: select.snps

### ** Examples

# Load data
data(LCT)
x <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)

# Select SNPs with a maf > 5%
y <- select.snps(x, maf > 0.05)
y



