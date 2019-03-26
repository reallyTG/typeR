library(SNPknock)


### Name: SNPknock.knockoffGenotypes
### Title: Knockoff copies of unphased genotypes
### Aliases: SNPknock.knockoffGenotypes

### ** Examples

# Load an example dataset of unphased genotypes from the package installation directory.
X_file = system.file("extdata", "genotypes.RData", package = "SNPknock")
load(X_file)

# Specify the location of the fastPHASE output files containing the parameter estimates.
# Example files can be found in the package installation directory.
r_file = system.file("extdata", "genotypes_rhat.txt", package = "SNPknock")
theta_file = system.file("extdata", "genotypes_thetahat.txt", package = "SNPknock")
alpha_file = system.file("extdata", "genotypes_alphahat.txt", package = "SNPknock")
char_file = system.file("extdata", "genotypes_origchars", package = "SNPknock")

# Read the parameter files and build the HMM
hmm = SNPknock.fp.loadFit(r_file, theta_file, alpha_file, char_file)

# Generate the knockoffs
Xk = SNPknock.knockoffGenotypes(X, hmm$r, hmm$alpha, hmm$theta)




