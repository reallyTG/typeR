library(ClusterR)


### Name: KMeans_rcpp
### Title: k-means using RcppArmadillo
### Aliases: KMeans_rcpp

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

km = KMeans_rcpp(dat, clusters = 2, num_init = 5, max_iters = 100, initializer = 'kmeans++')




