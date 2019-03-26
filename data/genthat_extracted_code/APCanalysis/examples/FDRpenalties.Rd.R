library(APCanalysis)


### Name: FDRpenalties
### Title: FDR Penalties for APC
### Aliases: FDRpenalties
### Keywords: design models

### ** Examples

## Penalties for a 8-run experiment that has 5 candidate effects are generated.
## The maximum model size is set to 5 and a false discovery rate of .05 is used.
FDRpenalties(n = 8, k = 5, m = 5, fdr = .05, reps = 12000)



