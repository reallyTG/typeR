library(COMBAT)


### Name: COMBAT
### Title: A Combined Gene-based Association Test
### Aliases: COMBAT

### ** Examples

# read SNP P values
file1 <- paste(path.package("COMBAT"),"extdata","SNP_info.txt.gz",sep="/")
snp.info  <- read.table(file1, header = TRUE, as.is=TRUE)
snp.pvals <- as.matrix(snp.info[,2])

# read reference genotype
file2 <- paste(path.package("COMBAT"),"extdata","SNP_ref.txt.gz",sep="/")
snp.ref   <- read.table(file2, header = TRUE)
snp.ref   <- as.matrix(snp.ref)
#call COMBAT
## No test: 
COMBAT(snp.pvals, snp.ref, nperm=100, ncores=2)
## End(No test)
## Don't show: 
COMBAT(snp.pvals, snp.ref, nperm=10, ncores=1)
## End(Don't show)



