library(gaston)


### Name: LD.thin
### Title: LD thinning
### Aliases: LD.thin
### Keywords: Linkage Disequilibrium

### ** Examples

# Load data
data(TTN)
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)

# Select SNPs in LD r^2 < 0.4, max.dist = 500 kb
y <- LD.thin(x, threshold = 0.4, max.dist = 500e3)
y

# Verifies that there is no SNP pair with LD r^2 > 0.4
# (note that the matrix ld.y has ones on the diagonal)
ld.y <- LD( y, lim = c(1, ncol(y)) )
sum( ld.y > 0.4 )  



