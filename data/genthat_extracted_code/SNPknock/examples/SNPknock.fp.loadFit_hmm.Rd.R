library(SNPknock)


### Name: SNPknock.fp.loadFit_hmm
### Title: Load the parameter estimates obtained by fastPHASE and assembles
###   the HMM model for genotype data
### Aliases: SNPknock.fp.loadFit_hmm

### ** Examples

# Specify the location of the fastPHASE output files containing the parameter estimates.
# Example files can be found in the package installation directory.
r_file = system.file("extdata", "genotypes_rhat.txt", package = "SNPknock")
alpha_file = system.file("extdata", "genotypes_alphahat.txt", package = "SNPknock")
theta_file = system.file("extdata", "genotypes_thetahat.txt", package = "SNPknock")
char_file = system.file("extdata", "genotypes_origchars", package = "SNPknock")

# Read the parameter files and build the HMM for unphased genotypes
hmm = SNPknock.fp.loadFit_hmm(r_file, alpha_file, theta_file, char_file)

# Read the parameter files and build the HMM for phased haplotypes
hmm = SNPknock.fp.loadFit_hmm(r_file, alpha_file, theta_file, char_file, phased=TRUE)




