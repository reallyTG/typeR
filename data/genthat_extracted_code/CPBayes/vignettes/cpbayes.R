## ----install_package, eval=FALSE, collapse = TRUE------------------------
#  install.packages("CPBayes")
#  library("CPBayes")

## ----load_Beta, collapse = TRUE------------------------------------------
library("CPBayes")
# Load the beta hat vector
BetaHatfile <- system.file("extdata", "BetaHat.rda", package = "CPBayes")
load(BetaHatfile)
BetaHat

## ----load_SE, collapse = TRUE--------------------------------------------
# Load the standard error vector
SEfile <- system.file("extdata", "SE.rda", package = "CPBayes")
load(SEfile)
SE

## ----names, collapse = TRUE----------------------------------------------
# Specify the name of the traits and the genetic variant.
traitNames <- paste("Disease", 1:10, sep = "")
SNP1 <- "rs1234"
traitNames
SNP1

## ----example_analytic_calculation_uncor, collapse = TRUE-----------------
#Run analytic_locFDR_BF_uncor function to analytically compute locFDR and log10BF for uncorrelated summary statistics.
result <- analytic_locFDR_BF_uncor(BetaHat, SE)
str(result)

## ----uncor_example, collapse = TRUE--------------------------------------
# Run the uncorrelated version of CPBayes (based on MCMC).
result <- cpbayes_uncor(BetaHat, SE, Phenotypes = traitNames, Variant = SNP1, MCMCiter = 10000, Burnin = 2000)

## ----result_structure, collapse= TRUE------------------------------------
# Overall summary of the primary results produced by cpbayes_uncor.
str(result)

## ----post_summary, collapse= TRUE----------------------------------------
# Post summary of the MCMC data produced by cpbayes_uncor.
PleioSumm <- post_summaries(result, level = 0.05)  
str(PleioSumm)

## ----forest_plot, collapse= TRUE-----------------------------------------
# Forest plot for the pleiotropy result obtained by cpbayes_uncor.
forest_cpbayes(result, level = 0.05)

## ----load_cBeta, collapse = TRUE-----------------------------------------
# Load the beta-hat vector
datafile <- system.file("extdata", "cBetaHat.rda", package = "CPBayes")
load(datafile)
cBetaHat

## ----load_cSE, collapse = TRUE-------------------------------------------
# Load the standard error vector
datafile <- system.file("extdata", "cSE.rda", package = "CPBayes")
load(datafile)
cSE

## ----load_cor, collapse = TRUE-------------------------------------------
# Load the correlation matrix of the beta-hat vector (cBetaHat)
datafile <- system.file("extdata", "cor.rda", package = "CPBayes")
load(datafile)
cor

## ----example_analytic_calculation_cor, collapse = TRUE-------------------
# Run analytic_locFDR_BF_cor function to analytically compute locFDR and log10BF for correlated summary statistics.
result <- analytic_locFDR_BF_cor(cBetaHat, cSE, cor)
str(result)

## ----cor_example, collapse = TRUE----------------------------------------
# Run the correlated version of CPBayes.
result <- cpbayes_cor(cBetaHat, cSE, cor, Phenotypes = traitNames, Variant = SNP1, MCMCiter = 10000, Burnin = 2000)

## ----result_structure_cor, collapse= TRUE--------------------------------
# Overall summary of the primary results produced by cpbayes_cor.
str(result)

## ----post_summary_cor, collapse= TRUE------------------------------------
# Post summary of the MCMC data produced by cpbayes_cor.
PleioSumm <- post_summaries(result, level = 0.05)  
str(PleioSumm)

## ----forest_plot_cor, collapse= TRUE-------------------------------------
# Forest plot for the pleiotropy result obtained by cpbayes_cor.
forest_cpbayes(result, level = 0.05)

## ----corln_estimation_example, collapse = TRUE---------------------------
# Example data of sample-overlap matrices
SampleOverlapMatrixFile <- system.file("extdata", "SampleOverlapMatrix.rda", package = "CPBayes")
load(SampleOverlapMatrixFile)
SampleOverlapMatrix

## ----run_corln_estimation, collapse = TRUE-------------------------------
# Estimate the correlation matrix of correlated beta-hat vector
n11 <- SampleOverlapMatrix$n11
n00 <- SampleOverlapMatrix$n00
n10 <- SampleOverlapMatrix$n10
cor <- estimate_corln(n11, n00, n10)
cor

