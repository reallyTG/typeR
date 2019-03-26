library(ClusterR)


### Name: Optimal_Clusters_KMeans
### Title: Optimal number of Clusters for Kmeans or Mini-Batch-Kmeans
### Aliases: Optimal_Clusters_KMeans

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)


#-------
# kmeans
#-------

opt_km = Optimal_Clusters_KMeans(dat, max_clusters = 10, criterion = "distortion_fK",

                                 plot_clusters = FALSE)
#'
#------------------
# mini-batch-kmeans
#------------------


params_mbkm = list(batch_size = 10, init_fraction = 0.3, early_stop_iter = 10)

opt_mbkm = Optimal_Clusters_KMeans(dat, max_clusters = 10, criterion = "distortion_fK",

                                   plot_clusters = FALSE, mini_batch_params = params_mbkm)
                                   



