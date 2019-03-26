library(VBTree)


### Name: VBTree-package
### Title: Vector Binary Tree to Make Your Data Management More Efficient
### Aliases: VBTree-package VBTree
### Keywords: package

### ** Examples

#View the data to be visited:
summary(datatest)
colnames(datatest)

#Structurize colnames of data into vector binary tree:
dl <- chrvec2dl(colnames(datatest))
vbt <- dl2vbt(dl)
vbt

#Setting subset in different forms, for example the pattern
#"Strain-(900~1100)-(0.01, 1)-0.6" is desired:
subunregdl <- list(c(1), c(1:5), c(2,4), c(1)) # undifined double list
subregdl <- advbtinq(vbt, subunregdl) # regularized double list
subvbt <- dl2vbt(subregdl) # sub vector binary tree
subts <- vbt2ts(subvbt) # tensor
subarr <- vbt2arr(subvbt) # array
subchrvec <- as.vector(subarr) # character vector

#Visit the data through different methods:
datavisit(datatest, c(1,2,2,1)) # by integer vector
datavisit(datatest, subunregdl) # by handmade double list
datavisit(datatest, subregdl) # by defined double list
datavisit(datatest, subvbt) # by vector binary tree
datavisit(datatest, subts) # by tensor
datavisit(datatest, subarr) # by array
datavisit(datatest, subchrvec) # by character vector



