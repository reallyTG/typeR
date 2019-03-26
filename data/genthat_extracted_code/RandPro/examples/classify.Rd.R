library(RandPro)


### Name: classify
### Title: Classification Function
### Aliases: classify
### Keywords: Dimension_Reduction, Johnson-Lindenstrauss_Lemma,
###   RandomProjection, classification, k-nn, svm

### ** Examples

# Load Library
library(RandPro)

#Load Iris Data
data("iris")

#Split the data into training set and test set of 75:25 ratio.
set.seed(101)
sample <- sample.int(n = nrow(iris), size = floor(.75*nrow(iris)), replace = FALSE)
trainn <- iris[sample, ]
testt  <- iris[-sample,]

#Extract the train label and test label
trainl <- trainn$Species
testl <- testt$Species
typeof(trainl)

#Remove the label from training set and test set
trainn <- trainn[,1:4]
testt <- testt[,1:4]

#classify the Iris data with default K-NN Classifier.
res <- classify(trainn,testt,trainl,testl)
res




