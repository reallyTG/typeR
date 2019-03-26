library(ClusterR)


### Name: predict_GMM
### Title: Prediction function for a Gaussian Mixture Model object
### Aliases: predict_GMM

### ** Examples


data(dietary_survey_IBS)

dat = as.matrix(dietary_survey_IBS[, -ncol(dietary_survey_IBS)])

dat = center_scale(dat)

gmm = GMM(dat, 2, "maha_dist", "random_subset", 10, 10)

# pr = predict_GMM(dat, gmm$centroids, gmm$covariance_matrices, gmm$weights)




