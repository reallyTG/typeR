library(gaston)


### Name: select.inds
### Title: Subsetting from a 'bed.matrix'
### Aliases: select.inds

### ** Examples

# Load data
data(LCT)
x <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)

# Select individuals with a call rate > 95% 
# and more than 5% of heterozygous genotypes
y <- select.inds(x, callrate > 0.95 & N1/(N0+N1+N2) > 0.05)
y



