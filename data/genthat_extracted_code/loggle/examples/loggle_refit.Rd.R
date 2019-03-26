library(loggle)


### Name: loggle.refit
### Title: A function to conduct model refitting given learned graph
###   structures
### Aliases: loggle.refit

### ** Examples

data(example)  # load example dataset
X <- example$X  # data matrix
dim(X)  # dimension of data matrix

# positions of time points to estimate graphs
pos <- round(seq(0.1, 0.9, length=9)*(ncol(X)-1)+1)
# estimate time-varying graphs and conduct model 
# selection via cross-validation
result <- loggle.cv.h(X, pos, h = 0.2, 
d.list = c(0, 0.05, 0.15, 1), lambda.list 
= c(0.2, 0.25), cv.fold = 3, fit.type = "pseudo", 
cv.vote.thres = 1, num.thread = 1)

# estimated adjacency matrices at each time point
adj.mat.opt <- result$cv.select.result$adj.mat.opt
# estimated precision matrices at each time point
# via model refitting
Omega.opt <- loggle.refit(X, pos, adj.mat.opt)



