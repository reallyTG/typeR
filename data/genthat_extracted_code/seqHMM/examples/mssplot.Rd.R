library(seqHMM)


### Name: mssplot
### Title: Interactive Stacked Plots of Multichannel Sequences and/or Most
###   Probable Paths for Mixture Hidden Markov Models
### Aliases: mssplot

### ** Examples

# Loading mixture hidden Markov model (mhmm object)
# of the biofam data
data("mhmm_biofam")

# Plotting the first cluster only
mssplot(mhmm_biofam, which.plots = 1)

if (interactive()) {
  # Interactive plot
  mssplot(mhmm_biofam)
}





