library(SCAT)


### Name: scat
### Title: Summary based conditional association test accounting for
###   heterogeneity in SNP coverage
### Aliases: scat

### ** Examples

library(SCAT)

## Path of files containing summary statistics
## Only required columns will be loaded, so your files could contain redundant columns. 
study1 <- system.file("extdata", package = "SCAT", "study1.txt.gz")
study2 <- system.file("extdata", package = "SCAT", "study2.txt.gz")
summary.files <- c(study1, study2)

## Prepare the PLINK files
## PLINK files for examples are built-in
fam <- vector("character", 2)
bim <- vector("character", 2)
bed <- vector("character", 2)

## suppose SNPs at chromosomes 5 and 8 are going to be tested
chr <- c(5, 8)
for(i in 1:2){
  fam[i] <- system.file("extdata", package = "SCAT", paste("chr", chr[i], ".fam", sep = ""))
  bim[i] <- system.file("extdata", package = "SCAT", paste("chr", chr[i], ".bim", sep = ""))
  bed[i] <- system.file("extdata", package = "SCAT", paste("chr", chr[i], ".bed", sep = ""))
}

reference <- data.frame(fam, bim, bed, stringsAsFactors = FALSE)

## different inflation factors are adjusted in two studies
## length of lambda and summary.files should be equal
lambda <- c(1.10, 1.08)

## we have two summary files, so there are two elements in the list nsamples
## the first summary file includes data calculated from meta-analysis of two sub-studies, 
## each with sample size 63390 and 5643
## see a few rows in study1
# s <- read.table(study1, header = TRUE, as.is = TRUE, nrows = 10)
# s$direction
## [1] "+?" "++" "+?" "++" "++" "+?" "++" "+?" "+?" "+?"
## '?' means a SNP is not included in that sub-study
## any other symbols means a SNP is included in that sub-study
## the second summary file includes data calculated from a single sub-study with sample size 61957
nsamples <- list(c(63390, 5643), 
                 c(61957))

## Space in model is okay, would be ignored
cond <- c('5:14957027, 5:32521333- 32522000', 
          '5 : 179741534', 
          '8:144662353 ,8:144663075,8:144663661')
test <- c('5:32525000 - 32526000, 5:98440820', 
          '5:33930441 ,5:179738100-179740000', 
          '8:144657269, 8:144664594')

model <- data.frame(cond, test, stringsAsFactors = FALSE)

## for each line in model, every single SNP specified in the 
## column 'test' would be tested by conditioned on all SNPs 
## in the column 'cond'
model

##                                   cond                              test
## 1     5:14957027, 5:32521333- 32522000 5:32525000 - 32526000, 5:98440820
## 2                        5 : 179741534 5:33930441 ,5:179738100-179740000
## 3 8:144662353 ,8:144663075,8:144663661          8:144657269, 8:144664594

## run it
scat(summary.files, model, reference, lambda, nsamples, min.maf = 0.01, max.R2 = 0.9)




