library(loggle)


### Name: loggle.cv.select
### Title: A function to conduct model selection based on cross validation
###   results
### Aliases: loggle.cv.select

### ** Examples

data(example)  # load example dataset
X <- example$X  # data matrix
dim(X)  # dimension of data matrix

# positions of time points to estimate graphs
pos <- round(seq(0.1, 0.9, length=9)*(ncol(X)-1)+1)
# estimate time-varying graphs via cross-validation
result <- loggle.cv(X, pos, h.list = c(0.2, 0.25), 
d.list = c(0, 0.05, 0.15, 1), lambda.list 
= c(0.2, 0.25), cv.fold = 3, fit.type = "pseudo", 
cv.vote.thres = 1, num.thread = 1)

# conduct model selection using cross-validation results
select.result <- loggle.cv.select(cv.result = result, 
select.type = "all_flexible", cv.vote.thres = 0.8)

# optimal values of h, d and lambda, and number of 
# selected edges at each time point
print(cbind("time" = seq(0.1, 0.9, length=9),
"h.opt" = rep(select.result$h.opt, length(pos)),
"d.opt" = select.result$d.opt,
"lambda.opt" = select.result$lambda.opt,
"edge.num.opt" = select.result$edge.num.opt))



