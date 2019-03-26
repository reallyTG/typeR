library(ClusterR)


### Name: Optimal_Clusters_GMM
### Title: Optimal number of Clusters for the gaussian mixture models
### Aliases: Optimal_Clusters_GMM

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

opt_gmm = Optimal_Clusters_GMM(dat, 10, criterion = "AIC", plot_data = FALSE)




