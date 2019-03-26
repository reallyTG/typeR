library(ClusterR)


### Name: external_validation
### Title: external clustering validation
### Aliases: external_validation

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

X = center_scale(dat)

km = KMeans_rcpp(X, clusters = 2, num_init = 5, max_iters = 100, initializer = 'kmeans++')

res = external_validation(dietary_survey_IBS$class, km$clusters, method = "adjusted_rand_index")




