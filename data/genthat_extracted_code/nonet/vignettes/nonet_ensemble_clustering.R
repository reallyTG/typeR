## ------------------------------------------------------------------------
library(caret)
library(ggplot2)
library(ClusterR)
library(nonet)

## ------------------------------------------------------------------------
set.seed(1001)

## ------------------------------------------------------------------------
dataframe <- data.frame(banknote_authentication)

## ------------------------------------------------------------------------
dataframe$class <- as.factor(dataframe$class)

## ------------------------------------------------------------------------
#Spliting training set into two parts based on outcome: 75% and 25%
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

## ------------------------------------------------------------------------
dim(trainSet); dim(testSet)

## ------------------------------------------------------------------------
str(trainSet)

## ------------------------------------------------------------------------
str(testSet)

## ------------------------------------------------------------------------
control <- rfeControl(functions = rfFuncs,
                   method = "repeatedcv",
                   repeats = 3,
                   verbose = FALSE)

## ------------------------------------------------------------------------
outcomeName<-'class'
predictors<-c("variance", "curtosis", "entropy")

## ------------------------------------------------------------------------
head(trainSet[,predictors])

## ------------------------------------------------------------------------
head(trainSet[,outcomeName])

## ------------------------------------------------------------------------
set.seed(900)
gmm_first <- GMM(trainSet[,predictors], 2, dist_mode = "maha_dist", seed_mode = "random_subset", km_iter = 10, em_iter = 10, verbose = F)          


## ------------------------------------------------------------------------
predict_clustering_first <- predict_GMM(trainSet[,predictors], gmm_first$centroids, gmm_first$covariance_matrices, gmm_first$weights) 
head(predict_clustering_first$cluster_proba[, 2])

## ------------------------------------------------------------------------
predict_cluster_first_class <- as.factor(ifelse(predict_clustering_first$cluster_proba[, 2] >= "0.5", "1", "0"))
head(predict_cluster_first_class)

## ------------------------------------------------------------------------
head(predict_clustering_first$cluster_labels)

## ------------------------------------------------------------------------

index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

## ------------------------------------------------------------------------
dim(trainSet); dim(testSet)

## ------------------------------------------------------------------------
str(trainSet)

## ------------------------------------------------------------------------
str(testSet)

## ------------------------------------------------------------------------
control <- rfeControl(functions = rfFuncs,
                   method = "repeatedcv",
                   repeats = 3,
                   verbose = FALSE)

## ------------------------------------------------------------------------
outcomeName<-'class'
predictors<-c("skewness", "curtosis", "entropy")

## ------------------------------------------------------------------------
head(trainSet[,predictors])

## ------------------------------------------------------------------------
head(trainSet[,outcomeName])

## ------------------------------------------------------------------------
set.seed(423)
gmm_second <- GMM(trainSet[,predictors], 2, dist_mode = "maha_dist", seed_mode = "random_subset", km_iter = 10, em_iter = 10, verbose = F)          


## ------------------------------------------------------------------------
predict_clustering_Second <- predict_GMM(trainSet[,predictors], gmm_second$centroids, gmm_second$covariance_matrices, gmm_second$weights) 
head(predict_clustering_Second$cluster_proba[, 2])

## ------------------------------------------------------------------------
predict_cluster_Second_class <- as.factor(ifelse(predict_clustering_Second$cluster_proba[, 2] >= "0.5", "1", "0"))
head(predict_cluster_Second_class)

## ------------------------------------------------------------------------
head(predict_clustering_Second$cluster_labels)

## ------------------------------------------------------------------------
Stack_object <- list(predict_clustering_first$cluster_proba[, 2], predict_clustering_Second$cluster_proba[, 2])

## ------------------------------------------------------------------------
names(Stack_object) <- c("Cluster_first", "Cluster_second")

## ------------------------------------------------------------------------
prediction_nonet <- nonet_ensemble(Stack_object, "Cluster_second")

## ------------------------------------------------------------------------
Prediction_data <- list(prediction_nonet, predict_clustering_first$cluster_proba[, 2], predict_clustering_Second$cluster_proba[, 2])

## ------------------------------------------------------------------------
names(Prediction_data) <- c("pred_nonet", "pred_clust_first", "pred_clust_second")

## ------------------------------------------------------------------------
Prediction_dataframe <- data.frame(Prediction_data)
head(Prediction_dataframe)

## ---- warning = FALSE----------------------------------------------------
plot_first <- nonet_plot(Prediction_dataframe$pred_nonet, Prediction_dataframe$pred_clust_first, Prediction_dataframe, plot_type = "hist")

## ------------------------------------------------------------------------
plot_first

## ---- warning = FALSE----------------------------------------------------
plot_second <- nonet_plot(Prediction_dataframe$pred_clust_first,  Prediction_dataframe$pred_clust_second, Prediction_dataframe, plot_type = "hist")
plot_second

## ---- warning = FALSE----------------------------------------------------
plot_third <- nonet_plot(Prediction_dataframe$pred_clust_second,  Prediction_dataframe$pred_clust_first, Prediction_dataframe, plot_type = "hist")
plot_third

