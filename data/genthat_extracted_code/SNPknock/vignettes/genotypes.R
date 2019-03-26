## ------------------------------------------------------------------------
library(SNPknock)
X_file = system.file("extdata", "genotypes.RData", package = "SNPknock")
load(X_file)
table(X)

## ------------------------------------------------------------------------
# Convert X into the suitable fastPHASE input format, write it into a temporary file
# and return the path to that file.
Xinp_file = SNPknock.fp.writeX(X)

## ------------------------------------------------------------------------
fp_path  = "~/bin/fastPHASE" # Path to the fastPHASE executable
# Call fastPHASE and return the path to the parameter estimate files
fp_outPath = SNPknock.fp.runFastPhase(fp_path, Xinp_file, K = 12, numit = 15)

## ----eval=FALSE----------------------------------------------------------
#  r_file = paste(fp_outPath, "_rhat.txt", sep="")
#  alpha_file = paste(fp_outPath, "_alphahat.txt", sep="")
#  theta_file = paste(fp_outPath, "_thetahat.txt", sep="")
#  char_file  = paste(fp_outPath, "_origchars", sep="")

## ------------------------------------------------------------------------
r_file = system.file("extdata", "genotypes_rhat.txt", package = "SNPknock")
alpha_file = system.file("extdata", "genotypes_alphahat.txt", package = "SNPknock")
theta_file = system.file("extdata", "genotypes_thetahat.txt", package = "SNPknock")
char_file  = system.file("extdata", "genotypes_origchars", package = "SNPknock")

## ------------------------------------------------------------------------
hmm = SNPknock.fp.loadFit(r_file, alpha_file, theta_file, char_file)

## ------------------------------------------------------------------------
Xk = SNPknock.knockoffGenotypes(X, hmm$r, hmm$alpha, hmm$theta)
table(Xk)

## ------------------------------------------------------------------------
library(SNPknock)
H_file = system.file("extdata", "haplotypes.RData", package = "SNPknock")
load(H_file)
table(H)

## ------------------------------------------------------------------------
# Convert X into the suitable fastPHASE input format, write it into a temporary file
# and return the path to that file.
Hinp_file = SNPknock.fp.writeX(H, phased = TRUE)

## ------------------------------------------------------------------------
fp_path  = "~/bin/fastPHASE" # Path to the fastPHASE executable
# Call fastPHASE and return the path to the parameter estimate files
fp_outPath = SNPknock.fp.runFastPhase(fp_path, Hinp_file, K = 12, numit = 15, phased = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  r_file = paste(fp_outPath, "_rhat.txt", sep="")
#  alpha_file = paste(fp_outPath, "_alphahat.txt", sep="")
#  theta_file = paste(fp_outPath, "_thetahat.txt", sep="")
#  char_file  = paste(fp_outPath, "_origchars", sep="")

## ------------------------------------------------------------------------
r_file = system.file("extdata", "haplotypes_rhat.txt", package = "SNPknock")
alpha_file = system.file("extdata", "haplotypes_alphahat.txt", package = "SNPknock")
theta_file = system.file("extdata", "haplotypes_thetahat.txt", package = "SNPknock")
char_file  = system.file("extdata", "haplotypes_origchars", package = "SNPknock")

## ------------------------------------------------------------------------
hmm = SNPknock.fp.loadFit(r_file, alpha_file, theta_file, char_file)

## ------------------------------------------------------------------------
Hk = SNPknock.knockoffHaplotypes(H, hmm$r, hmm$alpha, hmm$theta)
table(Hk)

