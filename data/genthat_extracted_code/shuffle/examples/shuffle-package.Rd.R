library(shuffle)


### Name: shuffle-package
### Title: The Shuffle Estimator for Explainable Variance
### Aliases: shuffle-package shuffle
### Keywords: package nonparametric design

### ** Examples

data(design_vec,fMRI_responses,prediction_res)

# Make example shorter - for paper example use T = ncol(fMRI_responses)
T = 156*4
fMRI_responses_sm = fMRI_responses[,1:T]
design_sm = design_vec[1:T]
permutation = rev(1:T)

prep_shuffle = prepareShuffle(design_sm,permutation)

var_explained = numeric(nrow(fMRI_responses_sm))
for (i in 1:nrow(fMRI_responses_sm)) {
    var_explained[i] = estimateShuffle(fMRI_responses_sm[i,],prep_shuffle)$effect
}

plot(var_explained, pmax(prediction_res,0)^2,
		    xlim = c(0,0.7), ylim = c(0,0.7), 
		    xlab = "Explainable variance", ylab = "Corr^2") 
abline(0,1,col=4)



