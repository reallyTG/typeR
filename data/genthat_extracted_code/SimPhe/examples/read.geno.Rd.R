library(SimPhe)


### Name: read.geno
### Title: Read genotype data based on the file format
### Aliases: read.geno

### ** Examples

## "snp.head" genotype file: rows are individuals and columns are SNPs
# get full path of example file
fgeno.path <- system.file("extdata", "10SNP.txt", package="SimPhe")

geno <- read.geno(fgeno.path, ftype = "snp.head")
head(geno)

## "plink" genotype file: 1).map and .ped; 2).bed, .fam and .bim
# get directory of plink example file
fpath <- strsplit(fgeno.path, "10SNP.txt")

#### Note: before run this example, specify your installation path of plink ####
# geno <- read.geno(paste0(fpath, "bdemo"), ftype = "plink", plink.path = "user's plink path")



