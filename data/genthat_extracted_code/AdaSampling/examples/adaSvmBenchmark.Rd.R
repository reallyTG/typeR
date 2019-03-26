library(AdaSampling)


### Name: adaSvmBenchmark
### Title: Benchmarking AdaSampling efficacy on noisy labelled data.
### Aliases: adaSvmBenchmark

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

# benchmark classification performance with different approaches
## No test: 
adaSvmBenchmark(data.mat = brca.mat, data.cls = brca.cls.noisy, data.cls.truth = brca.cls, cvSeed=1)
## End(No test)




