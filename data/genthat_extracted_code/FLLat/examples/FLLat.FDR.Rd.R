library(FLLat)


### Name: FLLat.FDR
### Title: False Discovery Rate for the Fused Lasso Latent Feature Model
### Aliases: FLLat.FDR plot.FDR

### ** Examples

## Load simulated aCGH data.
data(simaCGH)

## Run FLLat for J = 5, lam1 = 1 and lam2 = 9.
result <- FLLat(simaCGH,J=5,lam1=1,lam2=9)

## Estimate the FDRs.
result.fdr <- FLLat.FDR(simaCGH,result)

## Plotting the FDRs against the threshold values.    
plot(result.fdr)

## The threshold value which controls the FDR at 0.05.
result.fdr$thresh.control



