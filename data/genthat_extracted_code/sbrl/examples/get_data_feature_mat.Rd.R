library(sbrl)


### Name: get_data_feature_mat
### Title: GET BINARY MATRIX REPRESENTATION OF THE DATA-FEATURE
###   RELAITONSHIP
### Aliases: get_data_feature_mat
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(tictactoe)
featurenames <- c("c1=b", "c1=o", "c1=x")
get_data_feature_mat(tictactoe, featurenames)
#it will generate a binary matrix representing which observations are captured by which features.



