library(COMBAT)


### Name: gates
### Title: Calling Gene-based Association Tests
### Aliases: gates vegas simpleM

### ** Examples

# read SNP P values
file1 <- paste(path.package("COMBAT"),"extdata","SNP_info.txt.gz",sep="/")
snp.info  <- read.table(file1, header = TRUE, as.is=TRUE)
snp.pvals <- as.matrix(snp.info[,2])

# read reference genotype
file2 <- paste(path.package("COMBAT"),"extdata","SNP_ref.txt.gz",sep="/")
snp.ref   <- read.table(file2, header = TRUE)
snp.ref   <- as.matrix(snp.ref)

#compute correlation among SNPs
cor_G <- ld.Rsquare(snp.ref)

#call gates
(pval_gates <- gates(x=snp.pvals, cor_G=cor_G))

#call vegas
(pval_vegas <- vegas(x=snp.pvals, cor_G=cor_G))

#call simpleM
(pval_simpleM <- simpleM(x=snp.pvals, cor_G=cor_G))



