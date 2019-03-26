library(ACMEeqtl)


### Name: multithreadACME
### Title: Fast Parallelized Estimation of ACME Model for All Local
###   Gene-SNP Pairs
### Aliases: multithreadACME

### ** Examples

# First we generate a eQTL dataset in filematrix format 
tempdirectory = tempdir()
z = create_artificial_data(
    nsample = 50,
    ngene = 11,
    nsnp = 51,
    ncvrt = 1,
    minMAF = 0.2,
    saveDir = tempdirectory,
    returnData = FALSE,
    savefmat = TRUE,
    savetxt = FALSE,
    verbose = FALSE)

# In this example, we use 2 CPU cores (threads) 
# for testing of all gene-SNP pairs within 100,000 bp.
multithreadACME(
    genefm = "gene",
    snpsfm = "snps",
    glocfm = "gene_loc",
    slocfm = "snps_loc",
    cvrtfm = "cvrt",
    acmefm = "ACME",
    cisdist = 10e+06,
    threads = 1, # Use more for faster run
    workdir = file.path(tempdirectory, "filematrices"),
    verbose = FALSE)

# Now the filematrix `ACME` holds estimations for all local gene-SNP pairs.

fm = fm.open(file.path(tempdirectory, "filematrices", "ACME"))
TenResults = fm[,1:10]
rownames(TenResults) = rownames(fm)
close(fm)

show(t(TenResults))



