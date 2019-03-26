library(ARTP2)


### Name: warm.start
### Title: Performing ARTP2 test with warm start
### Aliases: warm.start

### ** Examples


## firstly, run the example in sARTP
## users can adjust the second round inflation in warm.start
## the first round inflation can be study-specific and adjusted in rARTP 
## or sARTP

library(ARTP2)
study1 <- system.file("extdata", package = "ARTP2", "study1.txt.gz")
study2 <- system.file("extdata", package = "ARTP2", "study2.txt.gz")
pathway <- system.file("extdata", package = "ARTP2", "pathway.txt.gz")
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
reference <- data.frame(fam, bim, bed)
options <- list(inspect.snp.n = 2, nperm = 1e4, 
                maf = .01, HWE.p = 1e-6, 
                gene.R2 = .9, 
                id.str = "unique-pathway-id", 
                out.dir = getwd(), save.setup = FALSE)
                
## different inflation factors are adjusted in two studies
## first round adjustment
lambda <- c(1.10, 1.08)
ncases <- list()
ncontrols <- list()
ncases[[1]] <- c(9580, 2591)
ncontrols[[1]] <- c(53810, 3052)
ncases[[2]] <- 7638
ncontrols[[2]] <- 54319

family <- 'binomial'

## do not run permutation
options$only.setup <- TRUE
## the first round study-specific inflation is adjusted as lambda = c(1.10, 1.08)
# setup <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda, 
#                ncases, ncontrols, options = options)

## the two rounds of inflation is adjusted as lambda2 = c(1.17370, 1.15236)
lambda2 <- lambda * 1.067
## run permutation to calculate p-value
options$only.setup <- FALSE
# ret1 <- sARTP(summary.files = c(study1, study2), pathway, family, reference, lambda2, 
#               ncases, ncontrols, options = options)

## or adjust the second round of inflation in warm.start
# ret2 <- warm.start(setup, lambda = 1.067)

# two ways of inflation adjustment should give same results
# ret1$pathway.pvalue == ret2$pathway.pvalue

###############################################################
###############################################################
## modify or specify the method
# setup$options$method <- 2
# setup$options$inspect.snp.n <- 3

## nthread = 2 for Linux only
## nthread will be reset to 1 under Windows and Mac OS
# ret3 <- warm.start(setup, nperm = 1e5, nthread = 2)




