library(loggle)


### Name: loggle.cv.vote
### Title: A function to learn time-varying graphical models using cv.vote
### Aliases: loggle.cv.vote

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
# estimate time-varying graphs
# num.thread can be set as large as number of cores 
# on a multi-core machine (however when p is large, 
# memory overflow should also be taken caution of)
ts <- proc.time()
result <- loggle.cv.vote(X, pos, h = 0.1, d = 0.15, 
lambda = 0.25, cv.fold = 3, fit.type = "pseudo", 
refit = TRUE, cv.vote.thres = 0.8, num.thread = 1)
te <- proc.time()
sprintf("Time used for loggle.cv.vote: %.2fs", (te-ts)[3])

# number of edges at each time point
print(cbind("time" = seq(0.1, 0.9, length=9),
"edge.num" = result$edge.num))

# graph at each time point
library(igraph)
par(mfrow = c(3, 3))
for(k in 1:length(pos)) {
  adj.matrix <- result$Omega[[k]] != 0
  net <- graph.adjacency(adj.matrix, mode = 
  "undirected", diag = FALSE)
  set.seed(0)
  plot(net, vertex.size = 10, vertex.color = 
  "lightblue", vertex.label = NA, edge.color = 
  "black", layout = layout.circle)
  title(main = paste("t =", 
  round(pos[k]/(ncol(X)-1), 2)), cex.main = 0.8)
}

# false discovery rate (FDR) and power based on 
# true precision matrices
edge.num.true <- sapply(1:K, function(i) 
(sum(Omega.true[[pos[i]]]!=0)-p)/2)
edge.num.overlap <- sapply(1:K, function(i) 
(sum(result$Omega[[i]] & Omega.true[[pos[i]]])-p)/2)
perform.matrix <- cbind(
"FDR" = 1 - edge.num.overlap / result$edge.num,
"power" = edge.num.overlap / edge.num.true)
print(apply(perform.matrix, 2, mean))



