library(ClusterR)


### Name: KMeans_arma
### Title: k-means using the Armadillo library
### Aliases: KMeans_arma

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

km = KMeans_arma(dat, clusters = 2, n_iter = 10, "random_subset")




