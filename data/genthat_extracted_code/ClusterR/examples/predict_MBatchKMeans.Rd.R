library(ClusterR)


### Name: predict_MBatchKMeans
### Title: Prediction function for Mini-Batch-k-means
### Aliases: predict_MBatchKMeans

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

MbatchKm = MiniBatchKmeans(dat, clusters = 2, batch_size = 20, num_init = 5, early_stop_iter = 10)

pr = predict_MBatchKMeans(dat, MbatchKm$centroids, fuzzy = FALSE)




