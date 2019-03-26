library(FLLat)


### Name: FLLat.PVE
### Title: Choosing the Number of Features for the Fused Lasso Latent
###   Feature Model
### Aliases: FLLat.PVE plot.PVE

### ** Examples

## Load simulated aCGH data.
data(simaCGH)

## Generate PVEs for J ranging from 1 to the number of samples divided by 2.
result.pve <- FLLat.PVE(simaCGH,J.seq=1:(ncol(simaCGH)/2))

## Generate PVE plot.
plot(result.pve)



