library(ClusterR)


### Name: MiniBatchKmeans
### Title: Mini-batch-k-means using RcppArmadillo
### Aliases: MiniBatchKmeans

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

MbatchKm = MiniBatchKmeans(dat, clusters = 2, batch_size = 20, num_init = 5, early_stop_iter = 10)




