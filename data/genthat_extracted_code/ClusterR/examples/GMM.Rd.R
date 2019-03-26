library(ClusterR)


### Name: GMM
### Title: Gaussian Mixture Model clustering
### Aliases: GMM

### ** Examples


data(dietary_survey_IBS)

dat = as.matrix(dietary_survey_IBS[, -ncol(dietary_survey_IBS)])

dat = center_scale(dat)

gmm = GMM(dat, 2, "maha_dist", "random_subset", 10, 10)




