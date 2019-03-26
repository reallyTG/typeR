library(RGCxGC)


### Name: scores
### Title: Method plot_scores
### Aliases: scores scores,MPCA-method

### ** Examples


data(MTBLS579)
# MPCA with mean-centered and scaled data
MTBLS579_mpca <- m_prcomp(MTBLS579, center = TRUE, scale = TRUE)
# Export scores matrix
scores(MTBLS579_mpca)



