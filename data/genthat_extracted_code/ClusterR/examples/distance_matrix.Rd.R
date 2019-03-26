library(ClusterR)


### Name: distance_matrix
### Title: Distance matrix calculation
### Aliases: distance_matrix

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = distance_matrix(dat, method = 'euclidean', upper = TRUE, diagonal = TRUE)




