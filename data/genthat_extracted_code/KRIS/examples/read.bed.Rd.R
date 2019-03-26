library(KRIS)


### Name: read.bed
### Title: Read the binary PLINK format (BED, BIM, and FAM)
### Aliases: read.bed

### ** Examples


## No test: 
#Use the example files embedded in the package.
bed <- system.file("extdata", "example_SNP.bed", package="KRIS")
bim <- system.file("extdata", "example_SNP.bim", package="KRIS")
fam <- system.file("extdata", "example_SNP.fam", package="KRIS")
snp <- read.bed(bed, bim, fam )

#Check the objects inside 'snp'
ls(snp)

#Preview $snp
print(snp$snp[1:10, 1:10])

#Preview $snp.info
head(snp$snp.info)

#Preview $ind.info
head(snp$ind.info)
## End(No test)



