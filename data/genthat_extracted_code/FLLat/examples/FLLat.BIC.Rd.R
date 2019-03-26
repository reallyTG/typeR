library(FLLat)


### Name: FLLat.BIC
### Title: Optimal Tuning Parameters for the Fused Lasso Latent Feature
###   Model
### Aliases: FLLat.BIC

### ** Examples

## Load simulated aCGH data.
data(simaCGH)

## Run FLLat.BIC to choose optimal tuning parameters for J = 5 features.
result.bic <- FLLat.BIC(simaCGH,J=5)

## Plot the features for the optimal FLLat model.
plot(result.bic$opt.FLLat)

## Plot a heatmap of the weights for the optimal FLLat model.
plot(result.bic$opt.FLLat,type="weights")



