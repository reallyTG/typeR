library(FLLat)


### Name: FLLat
### Title: Fused Lasso Latent Feature Model
### Aliases: FLLat

### ** Examples

## Load simulated aCGH data.
data(simaCGH)

## Run FLLat for J = 5, lam1 = 1 and lam2 = 9.
result <- FLLat(simaCGH,J=5,lam1=1,lam2=9)

## Plot the estimated features.
plot(result)

## Plot a heatmap of the estimated weights.
plot(result,type="weights")



