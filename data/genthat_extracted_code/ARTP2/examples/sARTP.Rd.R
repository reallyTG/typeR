library(ARTP2)


### Name: sARTP
### Title: ARTP test for summary data
### Aliases: sARTP

### ** Examples


library(ARTP2)

## Path of files containing summary statistics
## Only required columns will be loaded
study1 <- system.file("extdata", package = "ARTP2", "study1.txt.gz")
study2 <- system.file("extdata", package = "ARTP2", "study2.txt.gz")

## Path of a build-in file containing pathway definition
pathway <- system.file("extdata", package = "ARTP2", "pathway.txt.gz")

## Create data frame containing paths of build-in PLINK files that are going to used as reference
## As an example, use all chromosomes
chr <- 1:22
nchr <- length(chr)

fam <- vector("character", nchr)
bim <- vector("character", nchr)
bed <- vector("character", nchr)

for(i in 1:nchr){
  fam[i] <- system.file("extdata", package = "ARTP2", paste("chr", chr[i], ".fam", sep = ""))
  bim[i] <- system.file("extdata", package = "ARTP2", paste("chr", chr[i], ".bim", sep = ""))
  bed[i] <- system.file("extdata", package = "ARTP2", paste("chr", chr[i], ".bed", sep = ""))
}

reference <- data.frame(fam, bim, bed, stringsAsFactors = FALSE)

## Set the options. 
## Accumulate signal from the top 2 SNPs in each gene
## 1e5 replicates of resampling to estimate the p-value
options <- list(inspect.snp.n = 2, nperm = 1e4, 
                maf = .01, HWE.p = 1e-6, 
                gene.R2 = .9, 
                id.str = "unique-pathway-id", 
                out.dir = getwd(), save.setup = FALSE)
                
## different inflation factors are adjusted in two studies
lambda <- c(1.10, 1.08)

## two summary files, so there are two elements in each of two lists ncases and ncontrols
## the first summary file includes data calculated from meta-analysis of two sub-studies, 
## each with sample size 63390 (9580 cases and 53810 controls) and 5643 (2591 cases and 
## 3052 controls)
## see a few rows in study1
# s <- read.table(study1, header = TRUE, as.is = TRUE, nrows = 10)
# s$Direction
## [1] "+?" "+?" "++" "+?" "+?" "+?" "+?" "+?" "+?" "++"
## sub-study1 has 9580 cases, and sub-study2 has 2591 cases
## sub-study1 has 53810 cases, and sub-study2 has 3052 cases
## '?' means a SNP is not included in that sub-study
## any other symbols means a SNP is included in that sub-study
ncases <- list()
ncontrols <- list()
ncases[[1]] <- c(9580, 2591)
ncontrols[[1]] <- c(53810, 3052)

## the second summary file includes data calculated from one sub-studies with sample size 
## 61957 (7638 cases and 54319 controls)
ncases[[2]] <- 7638
ncontrols[[2]] <- 54319

# logistic regression is used in base model, thus ncases and ncontrols should be specified. 
family <- 'binomial'

## pathway test with two study files
# ret <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda, 
#              ncases, ncontrols, options = options)

# ret$pathway.pvalue
## [1] 0.04594541  # Mac OS
## [1] 0.05149485  # Linux with 1 thread
## [1] 0.03969603  # Linux with 32 threads

## Mac OS
# head(ret$gene.pvalue)
##       Gene Chr N.SNP      Pvalue
## 1     BDH2   4    10 0.000749925
## 2   UBE2D3   4     6 0.001849815
## 3     PBX2   6    22 0.003849615
## 4 PPP1R14D  15     9 0.003849615
## 5   MRPL10  17    18 0.011448855
## 6    SCYL1  11     3 0.019848015

## Linux with 1 thread
# head(ret$gene.pvalue)
##       Gene Chr N.SNP      Pvalue
## 1     BDH2   4    10 0.000949905
## 2   UBE2D3   4     6 0.001699830
## 3 PPP1R14D  15     9 0.003949605
## 4     PBX2   6    22 0.004299570
## 5   MRPL10  17    18 0.012448755
## 6    SCYL1  11     3 0.017148285

## Linux with 32 threads
# head(ret$gene.pvalue)
##       Gene Chr N.SNP      Pvalue
## 1   UBE2D3   4     6 0.000849915
## 2     BDH2   4    10 0.001049895
## 3 PPP1R14D  15     9 0.003949605
## 4     PBX2   6    22 0.004899510
## 5   MRPL10  17    18 0.012798720
## 6    SCYL1  11     3 0.015048495

## pathway test with each of two studies
# ret1 <- sARTP(summary.files = study1, pathway, family, reference, lambda[1], 
#               ncases[1], ncontrols[1], options = options)

# ret2 <- sARTP(summary.files = study2, pathway, family, reference, lambda[2], 
#               ncases[2], ncontrols[2], options = options)

# ret1$pathway.pvalue
## [1] 0.04279572  # Mac OS
## [1] 0.03519648  # Linux with 1 thread
## [1] 0.04644536  # Linux with 32 threads

# ret2$pathway.pvalue
## [1] 0.3092691  # Mac OS
## [1] 0.2870213  # Linux with 1 thread
## [1] 0.3010699  # Linux with 32 threads

##################################################
## The reference is passed as an individual-level genotype data frame

data(ref.geno)
# ret.ref <- sARTP(summary.files = c(study1, study2), pathway, family, ref.geno, lambda, 
#                  ncases, ncontrols, options = options)

# ret.ref$pathway.pvalue == ret$pathway.pvalue

##################################################
## The reference genotype data can also be merged into a single set of PLINK files

bed <- system.file("extdata", package = "ARTP2", "ref.bed")
bim <- system.file("extdata", package = "ARTP2", "ref.bim")
fam <- system.file("extdata", package = "ARTP2", "ref.fam")

reference <- data.frame(fam, bim, bed)
# ret.comb <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda, 
#                   ncases, ncontrols, options = options)
# ret.comb$pathway.pvalue == ret$pathway.pvalue

################

## exclude some regions
exc.reg1 <- data.frame(Chr = c(1, 1, 22), 
                       Pos = c(1706160, 11979231, 51052379), 
                       Radius = c(5000, 0, 2000))
options$excluded.regions <- exc.reg1

# ret.exc1 <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda, 
#                   ncases, ncontrols, options = options)

# ret.exc1$pathway.pvalue
## [1] 0.04619538 # Mac OS
## [1] 0.0510449  # Linux with 1 thread
## [1] 0.04054595 # Linux with 32 threads

# sum(ret.exc1$deleted.snps$reason == 'RM_BY_REGIONS')

## or equivalently
exc.reg2 <- data.frame(Chr = c(1, 1, 22), 
                       Start = c(1701160, 11979231, 51050379), 
                       End = c(1711160, 11979231, 51054379))
options$excluded.regions <- exc.reg2

# ret.exc2 <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda, 
#                   ncases, ncontrols, options = options)
# ret.exc1$pathway.pvalue == ret.exc2$pathway.pvalue

#################

## select a subset of subjects in plink files as the reference
## options$selected.subs should be in the same format as the first column of fam file
## load character vector subj.id of 400 subjects from build-in dataset
data(subj.id, package = "ARTP2")
head(subj.id)
options$selected.subs <- subj.id
options$excluded.regions <- NULL

# ret.sel <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda, 
#                  ncases, ncontrols, options = options)
# ret.sel$pathway.pvalue
## [1] 0.03469653 # Mac OS
## [1] 0.05284472 # Linux with 1 thread
## [1] 0.04164584 # Linux with 32 threads




