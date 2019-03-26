library(seqHMM)


### Name: mhmm_biofam
### Title: Mixture hidden Markov model for the biofam data
### Aliases: mhmm_biofam
### Keywords: datasets

### ** Examples

data("mhmm_biofam")

# use conditional_se = FALSE for more accurate standard errors
# (these are considerebly slower to compute)
summary(mhmm_biofam$model)

if (interactive()) {
  # Plotting the model for each cluster (change with Enter)
  plot(mhmm_biofam)
}




