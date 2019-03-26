library(GRAPE)


### Name: predictClassGRAPE
### Title: GRAPE Classification
### Aliases: predictClassGRAPE

### ** Examples

# Toy example of two classes
set.seed(10); path_genes <- c("gA","gB","gC","gD"); nsamps <- 50 # Four genes, 50 samples per class
class_one_samps <- matrix(NA,nrow=length(path_genes),ncol=nsamps) # Class 1
rownames(class_one_samps) <- path_genes
class_one_samps[1,] <- rnorm(ncol(class_one_samps),4,2)
class_one_samps[2,] <- rnorm(ncol(class_one_samps),5,4)
class_one_samps[3,] <- rnorm(ncol(class_one_samps),1,1)
class_one_samps[4,] <- rnorm(ncol(class_one_samps),2,1)
class_two_samps <- matrix(NA,nrow=length(path_genes),ncol=nsamps) # Class 2
rownames(class_two_samps) <- path_genes
class_two_samps[1,] <- rnorm(ncol(class_two_samps),2,3)
class_two_samps[2,] <- rnorm(ncol(class_two_samps),5,2)
class_two_samps[3,] <- rnorm(ncol(class_two_samps),1,1)
class_two_samps[4,] <- rnorm(ncol(class_two_samps),0,1)
all_samps <- cbind(class_one_samps,class_two_samps)
labels <- c(rep(1,nsamps),rep(2,nsamps))
testid <- sample.int(100,20)
trainmat <- all_samps[,-testid]
train_labels <- labels[-testid]
testmat <- all_samps[,testid]
test_labels <- labels[testid]
yhat <- predictClassGRAPE(trainmat,testmat,train_labels,w_quad)
sum(diag(table(test_labels,yhat)))/length(test_labels) # accuracy
# [1] 0.8



