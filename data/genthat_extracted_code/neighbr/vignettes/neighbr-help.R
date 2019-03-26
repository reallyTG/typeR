## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----load_packages-------------------------------------------------------
library(neighbr)
library(knitr)
set.seed(123)
options(digits=3)

## ----iris_categorical_target_example-------------------------------------
data(iris)
train_set <- iris[1:147,] #train set contains all targets and features
test_set <- iris[148:150,!names(iris) %in% c("Species")] #test set does not contain any targets

#run knn function
fit <- knn(train_set=train_set,test_set=test_set,
            k=3,
            categorical_target="Species",
            comparison_measure="squared_euclidean")

#show predictions
kable(fit$test_set_scores)

## ----iris_mixed_targets_clustering_example-------------------------------
data(iris)
iris$ID <- c(1:150) #an ID column is necessary if ranks are to be calculated
train_set <- iris[1:147,] #train set contains all predicted variables, features, and ID column
test_set <- iris[148:150,!names(iris) %in% c("Petal.Width","Species","ID")] #test set does not contain predicted variables or ID column

fit <- knn(train_set=train_set,test_set=test_set,
            k=3,
            categorical_target="Species",
            continuous_target= "Petal.Width",
            comparison_measure="squared_euclidean",
            return_ranked_neighbors=3,
            id="ID")

kable(fit$test_set_scores)

## ----iris_clustering_example---------------------------------------------
data(iris)
iris$ID <- c(1:150) #an ID column is necessary if ranks are to be calculated
train_set <- iris[1:147,-c(5)] #remove `Species` categorical variable
test_set <- iris[148:150,!names(iris) %in% c("Species","ID")] #test set does not contain predicted variables or ID column

fit <- knn(train_set=train_set,test_set=test_set,
            k=5,
            comparison_measure="squared_euclidean",
            return_ranked_neighbors=4,
            id="ID")

kable(fit$test_set_scores)

## ----logical_features_example--------------------------------------------
library(mlbench)
data(HouseVotes84)
dat <- HouseVotes84[complete.cases(HouseVotes84),] # remove any rows with N/A elements

# change all {yes,no} factors to {0,1}
feature_names <- names(dat)[!names(dat) %in% c("Class","ID")]
for (n in feature_names) {
  levels(dat[,n])[levels(dat[,n])=="n"] <- 0
  levels(dat[,n])[levels(dat[,n])=="y"] <- 1
}

# change factors to numeric
for (n in feature_names) {dat[,n] <- as.numeric(levels(dat[,n]))[dat[,n]]}

dat$ID <- c(1:nrow(dat)) #an ID column is necessary if ranks are to be calculated

train_set <- dat[1:225,]
test_set <- dat[226:232,!names(dat) %in% c("Class","ID")] #test set does not contain predicted variables or ID column

fit <- knn(train_set=train_set,test_set=test_set,
            k=7,
            categorical_target = "Class",
            comparison_measure="jaccard",
            return_ranked_neighbors=3,
            id="ID")

kable(fit$test_set_scores)

## ------------------------------------------------------------------------
distance(c(1,2,3),c(2,3,4),"squared_euclidean")
similarity(c(0,1,0,0),c(1,1,1,0),"simple_matching")

