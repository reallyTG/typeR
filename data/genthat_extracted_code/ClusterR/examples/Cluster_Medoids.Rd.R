library(ClusterR)


### Name: Cluster_Medoids
### Title: Partitioning around medoids
### Aliases: Cluster_Medoids

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

cm = Cluster_Medoids(dat, clusters = 3, distance_metric = 'euclidean', swap_phase = TRUE)




