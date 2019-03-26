library(loggle)


### Name: loggle.cv.select.h
### Title: A function to conduct model selection based on cross validation
###   results (with 'h' fixed)
### Aliases: loggle.cv.select.h

### ** Examples

data(example)  # load example dataset
X <- example$X  # data matrix
dim(X)  # dimension of data matrix

# positions of time points to estimate graphs
pos <- round(seq(0.1, 0.9, length=9)*(ncol(X)-1)+1)
# estimate time-varying graphs via cross-validation
result <- loggle.cv.h(X, pos, h = 0.2, 
d.list = c(0, 0.05, 0.15, 1), lambda.list 
= c(0.2, 0.25), cv.fold = 3, fit.type = "pseudo", 
cv.vote.thres = 1, num.thread = 1)

# conduct model selection using cross-validation results
select.result <- loggle.cv.select.h(cv.result = result, 
select.type = "all_flexible", cv.vote.thres = 0.8)

# optimal values of d and lambda, and number of 
# selected edges at each time point
print(cbind("time" = seq(0.1, 0.9, length=9),
"d.opt" = select.result$d.opt,
"lambda.opt" = select.result$lambda.opt,
"edge.num.opt" = select.result$edge.num.opt))



