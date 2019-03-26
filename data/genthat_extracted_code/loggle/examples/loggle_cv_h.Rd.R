library(loggle)


### Name: loggle.cv.h
### Title: A function to learn time-varying graphical models via cross
###   validation (with 'h' fixed)
### Aliases: loggle.cv.h

### ** Examples

data(example)  # load example dataset
# data matrix and true precision matrices
X <- example$X
Omega.true <- example$Omega.true
dim(X)  # dimension of data matrix
p <- nrow(X)  # number of variables

# positions of time points to estimate graphs
pos <- round(seq(0.1, 0.9, length=9)*(ncol(X)-1)+1)
K <- length(pos)
# estimate time-varying graphs and conduct model 
# selection via cross-validation
# num.thread can be set as large as number of cores 
# on a multi-core machine (however when p is large, 
# memory overflow should also be taken caution of)
ts <- proc.time()
result <- loggle.cv.h(X, pos, h = 0.2, 
d.list = c(0, 0.05, 0.15, 1), lambda.list 
= c(0.2, 0.25), cv.fold = 3, fit.type = "pseudo", 
cv.vote.thres = 1, num.thread = 1)
te <- proc.time()
sprintf("Time used for loggle.cv.h: %.2fs", (te-ts)[3])

# optimal values of d and lambda, and number of 
# selected edges at each time point
select.result <- result$cv.select.result
print(cbind("time" = seq(0.1, 0.9, length=9),
"d.opt" = select.result$d.opt,
"lambda.opt" = select.result$lambda.opt,
"edge.num.opt" = select.result$edge.num.opt))

# false discovery rate (FDR) and power based on 
# true precision matrices for selected model
edge.num.opt <- select.result$edge.num.opt
edge.num.true <- sapply(1:K, function(i) 
(sum(Omega.true[[pos[i]]]!=0)-p)/2)
edge.num.overlap <- sapply(1:K, function(i) 
(sum(select.result$adj.mat.opt[[i]]
& Omega.true[[pos[i]]])-p)/2)
perform.matrix <- cbind(
"FDR" = 1 - edge.num.overlap / edge.num.opt,
"power" = edge.num.overlap / edge.num.true)
print(apply(perform.matrix, 2, mean))



