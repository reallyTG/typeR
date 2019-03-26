## ----setup, include=FALSE------------------------------------------------
# knitr::opts_chunk$set(echo = TRUE)

## ----install, eval=FALSE-------------------------------------------------
#  install.packages("ACMEeqtl")

## ----loadHidden, echo=FALSE, warning=FALSE, message=FALSE----------------
library(pander)
panderOptions("digits", 3)
library(ACMEeqtl)

## ----load----------------------------------------------------------------
library(ACMEeqtl)

## ----singleInit----------------------------------------------------------
# Model parameters
beta0 = 10000
beta1 = 50000

# Data dimensions
nsample = 1000
ncvrt = 19

### Data generation
### Zero average covariates
cvrt = matrix(rnorm(nsample * ncvrt), nsample, ncvrt)
cvrt = t(t(cvrt) - colMeans(cvrt))

# Generate SNPs
s = rbinom(n = nsample, size = 2, prob = 0.2)

# Generate log-normalized expression
y = log(beta0 + beta1 * s) + 
	cvrt %*% rnorm(ncvrt) + 
	rnorm(nsample)

## ----singleEstim---------------------------------------------------------
z1 = effectSizeEstimationR(s, y, cvrt)
z2 = effectSizeEstimationC(s, y, cvrt)

pander(rbind(z1,z2))

## ----eqtlInit------------------------------------------------------------
tempdirectory = tempdir()
z = create_artificial_data(
    nsample = 100,
    ngene = 100,
    nsnp = 501,
    ncvrt = 1,
    minMAF = 0.2,
    saveDir = tempdirectory,
    returnData = FALSE,
    savefmat = TRUE,
    savetxt = FALSE,
    verbose = FALSE)

## ----eqtlEstim-----------------------------------------------------------
multithreadACME(
    genefm = "gene",
    snpsfm = "snps",
    glocfm = "gene_loc",
    slocfm = "snps_loc",
    cvrtfm = "cvrt",
    acmefm = "ACME",
    cisdist = 1.5e+06,
    threads = 2,
    workdir = file.path(tempdirectory, "filematrices"),
    verbose = FALSE)

## ----eqtlLool------------------------------------------------------------
fm = fm.open(file.path(tempdirectory, "filematrices", "ACME"))
TenResults = fm[,1:10]
rownames(TenResults) = rownames(fm)
close(fm)

pander(t(TenResults))

## ----eqtl-multiSNP-------------------------------------------------------
multisnpACME(
	genefm = "gene",
	snpsfm = "snps",
	glocfm = "gene_loc",
	slocfm = "snps_loc",
	cvrtfm = "cvrt",
	acmefm = "ACME",
	workdir = file.path(tempdirectory, "filematrices"),
	genecap = Inf,
	verbose = FALSE)

## ----eqtlLool2-----------------------------------------------------------
fm = fm.open(file.path(tempdirectory, "filematrices", "ACME_multiSNP"))
TenResults = fm[,1:10]
rownames(TenResults) = rownames(fm)
close(fm)

pander(t(TenResults))

