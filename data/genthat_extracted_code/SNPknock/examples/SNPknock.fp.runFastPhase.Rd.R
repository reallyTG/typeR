library(SNPknock)


### Name: SNPknock.fp.runFastPhase
### Title: Calls fastPHASE to fit an HMM to genotype data
### Aliases: SNPknock.fp.runFastPhase

### ** Examples

fp_path  = "~/bin/fastPHASE" # Path to the fastPHASE executable

# Run fastPHASE on unphased genotypes
# Specify the path to the genotype input file in ".inp" format.
# An example file containing unphased genotypes can be found in the package installation folder.
X_file = system.file("extdata", "genotypes.inp", package = "SNPknock")
fp_outPath = SNPknock.fp.runFastPhase(fp_path, X_file)

# Run fastPHASE on phased haplotypes
# An example file containing phased haplotypes can be found in the package installation folder.
H_file = system.file("extdata", "haplotypes.inp", package = "SNPknock")
fp_outPath = SNPknock.fp.runFastPhase(fp_path, H_file, phased=TRUE)




