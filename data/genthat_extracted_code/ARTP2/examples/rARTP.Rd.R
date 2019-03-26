library(ARTP2)


### Name: rARTP
### Title: ARTP test for raw data
### Aliases: rARTP

### ** Examples


library(ARTP2)

## Load the sample data
data(data, package = "ARTP2")
head(data[, 1:7])

## Load a build-in data frame containing pathway definition
## it can also be the path of the file
data(pathway, package = "ARTP2")
head(pathway)

## Define the formula of base risk model
formula <- formula(case_control ~ sex + age + bmi + factor(study))

## binary outcome
family <- "binomial"

## Set the options. 
## Accumulate signal from the top 5 SNPs in each gene
## 1e5 replicates of resampling to estimate the p-value
options <- list(inspect.snp.n = 5, nperm = 1e5, 
                maf = .01, HWE.p = 1e-6, 
                gene.R2 = .9, 
                id.str = "unique-pathway-id", 
                out.dir = getwd(), save.setup = FALSE)

## pathway test, can take a while
## data contains outcome, covariates and genotypes
# ret1 <- rARTP(formula, data = data, pathway, family, options = options)

# ret1$pathway.pvalue 
## [1] 0.03218968 # Mac OS
## [1] 0.02188978 # Linux with 1 thread
## [1] 0.03455965 # Linux with 32 threads

## Mac OS
# head(ret1$gene.pvalue)
##     Gene Chr N.SNP      Pvalue
## 1  USP30  12    18 0.001319987
## 2  DCAF7  17     9 0.071644284
## 3   CANX   5    13 0.266337337
## 4  SOX12  20    15 0.349406506
## 5 CDKN2C   1     6 0.358031420
## 6   FEN1  11     4 0.415345847

## Linux with 1 thread
# head(ret1$gene.pvalue)
##     Gene Chr N.SNP      Pvalue
## 1  USP30  12    18 0.000899991
## 2  DCAF7  17     9 0.070219298
## 3   CANX   5    13 0.269772302
## 4  SOX12  20    15 0.350061499
## 5 CDKN2C   1     6 0.357766422
## 6   FEN1  11     4 0.414760852

## Linux with 32 threads
# head(ret1$gene.pvalue)
##     Gene Chr N.SNP      Pvalue
## 1  USP30  12    18 0.001454985
## 2  DCAF7  17     9 0.070379296
## 3   CANX   5    13 0.266927331
## 4  SOX12  20    15 0.350481495
## 5 CDKN2C   1     6 0.357701423
## 6   FEN1  11     4 0.414425856

# table(ret1$deleted.snps$reason)
# head(ret1$deleted.genes)


##################################################
## Another way to use this function
## Load a vector 'geno' containing file names of genotype
data(geno, package = 'ARTP2')

## Set the paths of genotype files
## in this example, each file contains SNPs in a gene
geno.files <- system.file("extdata", package = "ARTP2", geno)

## data contains outcome, covariates
## Genotypes are instead included in files specified in geno.files
## geno.files are plain text files (or .gz file), which can be read by read.table
# ret2 <- rARTP(formula, data = data[, 2:6], pathway, family, geno.files, 
#               options = options)
# ret2$pathway.pvalue == ret1$pathway.pvalue


##################################################
## The third way
## Genotypes are instead stored as binary PLINK files (bed, bim, and fam)
bed <- system.file("extdata", package = "ARTP2", "raw.bed")
bim <- system.file("extdata", package = "ARTP2", "raw.bim")
fam <- system.file("extdata", package = "ARTP2", "raw.fam")
geno.files <- data.frame(fam, bim, bed, stringsAsFactors = FALSE)

## a column SUBID must be included in data, in this example, first column is SUBID
# ret3 <- rARTP(formula, data = data[, 1:6], pathway, family, geno.files, 
#               options = options)
# ret3$pathway.pvalue == ret1$pathway.pvalue





