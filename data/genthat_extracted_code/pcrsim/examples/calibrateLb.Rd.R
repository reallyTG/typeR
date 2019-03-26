library(pcrsim)


### Name: calibrateLb
### Title: Calibrate Inter-locus Balance
### Aliases: calibrateLb

### ** Examples

# Experimental inter-locus balances for the STR kit to be simulated (sums to 1).
target <- c(0.20, 0.10, 0.15, 0.25, 0.30)
 
# Find PCR efficiency values that upon simulation
# satisfy the experimental data for 0.5 ng of input DNA.
set.seed(10) # For reproducibility.
calibrateLb(sim=10, target=target, amount=0.5, seed=0.85, progress=FALSE)

# Locus specific PCR efficency parameters can now be used as parameters.
# [1] 0.858 0.816 0.841 0.871 0.883 



