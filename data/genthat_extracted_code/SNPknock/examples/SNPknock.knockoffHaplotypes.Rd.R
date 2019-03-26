library(SNPknock)


### Name: SNPknock.knockoffHaplotypes
### Title: Knockoff copies of phased haplotypes
### Aliases: SNPknock.knockoffHaplotypes

### ** Examples

# Load an example dataset of phased haplotypes from the package installation directory.
H_file = system.file("extdata", "haplotypes.RData", package = "SNPknock")
load(H_file)

# Specify the location of the fastPHASE output files containing the parameter estimates.
# Example files can be found in the package installation directory.
r_file = system.file("extdata", "haplotypes_rhat.txt", package = "SNPknock")
theta_file = system.file("extdata", "haplotypes_thetahat.txt", package = "SNPknock")
alpha_file = system.file("extdata", "haplotypes_alphahat.txt", package = "SNPknock")
char_file = system.file("extdata", "haplotypes_origchars", package = "SNPknock")

# Read the parameter files and build the HMM
hmm = SNPknock.fp.loadFit(r_file, theta_file, alpha_file, char_file)

# Generate the knockoffs
Hk = SNPknock.knockoffHaplotypes(H, hmm$r, hmm$alpha, hmm$theta)




