library(SNPknock)


### Name: SNPknock.fp.writeX
### Title: Convert a genetic matrix X into the fastPHASE input format
### Aliases: SNPknock.fp.writeX

### ** Examples

# Convert unphased genotypes
# Load an example data matrix X from the package installation directory.
X_file = system.file("extdata", "genotypes.RData", package = "SNPknock")
load(X_file)
# Write X in a temporary file
Xinp_file = SNPknock.fp.writeX(X)

# Convert phased haplotypes
# Load an example data matrix H from the package installation directory.
H_file = system.file("extdata", "haplotypes.RData", package = "SNPknock")
load(H_file)
# Write H in a temporary file
Hinp_file = SNPknock.fp.writeX(H, phased=TRUE)




