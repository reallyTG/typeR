library(ClusterR)


### Name: Clara_Medoids
### Title: Clustering large applications
### Aliases: Clara_Medoids

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

clm = Clara_Medoids(dat, clusters = 3, samples = 5, sample_size = 0.2, swap_phase = TRUE)




