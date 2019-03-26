library(AdaSampling)


### Name: adaSample
### Title: Implementation of AdaSampling for positive unlabelled and label
###   noise learning.
### Aliases: adaSample

### ** Examples

# Load the example dataset
data(brca)
head(brca)

# First, clean up the dataset to transform into the required format.
brca.mat <- apply(X = brca[,-10], MARGIN = 2, FUN = as.numeric)
brca.cls <- sapply(X = brca$cla, FUN = function(x) {ifelse(x == "malignant", 1, 0)})
rownames(brca.mat) <- paste("p", 1:nrow(brca.mat), sep="_")

# Introduce 40% noise to positive class and 30% noise to the negative class
set.seed(1)
pos <- which(brca.cls == 1)
neg <- which(brca.cls == 0)
brca.cls.noisy <- brca.cls
brca.cls.noisy[sample(pos, floor(length(pos) * 0.4))] <- 0
brca.cls.noisy[sample(neg, floor(length(neg) * 0.3))] <- 1

# Identify positive and negative examples from the noisy dataset
Ps <- rownames(brca.mat)[which(brca.cls.noisy == 1)]
Ns <- rownames(brca.mat)[which(brca.cls.noisy == 0)]

# Apply AdaSampling method on the noisy data
brca.preds <- adaSample(Ps, Ns, train.mat=brca.mat, test.mat=brca.mat, classifier = "knn")
head(brca.preds)

# Orignal accuracy from the labels
accuracy <- sum(brca.cls.noisy == brca.cls) / length(brca.cls)
accuracy

# Accuracy after applying AdaSampling method
accuracyWithAdaSample <- sum(ifelse(brca.preds[,"P"] > 0.5, 1, 0) == brca.cls) / length(brca.cls)
accuracyWithAdaSample




