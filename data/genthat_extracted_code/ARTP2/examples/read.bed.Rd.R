library(ARTP2)


### Name: read.bed
### Title: Reading data from binary PLINK files
### Aliases: read.bed

### ** Examples


# Load the sample data

bed <- system.file("extdata", package = 'ARTP2', 'chr1.bed')
bim <- system.file("extdata", package = 'ARTP2', 'chr1.bim')
fam <- system.file("extdata", package = 'ARTP2', 'chr1.fam')

## first five SNPs
b <- read.table(bim, header = FALSE, as.is = TRUE, nrows = 5)
## first 50 subjects
f <- read.table(fam, header = FALSE, as.is = TRUE, nrows = 50)
geno <- read.bed(bed, bim, fam, sel.snps = b[, 2], sel.subs = f[, 2])

dim(geno) # 50 x 5





