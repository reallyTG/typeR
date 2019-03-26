library(loggle)


### Name: stockdata
### Title: Stock prices of S&P 500 companies from 2007 to 2016
### Aliases: stockdata

### ** Examples

data(stockdata)

date.index <- rownames(stockdata$data)
stock.sector <- stockdata$info[, "sector"]

# select stocks from sector Materials and
# Telecommunications Services
sp.m <- t(stockdata$data[date.index < "2011-01-01", 
stock.sector == "Materials"])
sp.t <- t(stockdata$data[date.index < "2011-01-01", 
stock.sector == "Telecommunications Services"])
sp <- rbind(sp.m, sp.t)

# construct data matrix by taking log ratio of prices
# between adjacent time points
p <- dim(sp)[1]
N <- dim(sp)[2]-1
X <- matrix(0, p, N)
for(i in 1:p) {
  X[i, ] <- scale(log(sp[i, -1] / sp[i, -(N+1)]))
}
dim(X)  # dimension of data matrix

# positions of time points to estimate graphs
pos <- round(seq(0.1, 0.9, length=9)*(N-1)+1)
# estimate time-varying graphs and conduct model 
# selection via cross-validation
result <- loggle.cv.h(X, pos, h = 0.1, 
d.list = c(0, 0.02, 0.05), 
lambda.list = 10 ^ c(-0.5, -0.3), cv.fold = 3,
fit.type = "pseudo", num.thread = 1)

# graphs at specified time points in selected model
library(igraph)
par(mfrow = c(1, 1))
pos.plot <- round(seq(2, length(pos)-1, length = 4))
for(k in 1:length(pos.plot)) {
  adj.matrix <- 
  result$cv.select.result$adj.mat.opt[[pos.plot[k]]]
  net <- graph.adjacency(adj.matrix, mode = "undirected", 
  diag = FALSE)
  set.seed(0)
  V(net)$color <- rep(rainbow(2), times = c(nrow(sp.m), 
  nrow(sp.t)))
  sp.ind <- rep(1:2, times = c(nrow(sp.m), nrow(sp.t)))
  E(net)$color <- apply(get.edgelist(net), 1, function(x) 
  ifelse(sp.ind[x[1]] == sp.ind[x[2]], "black", "gray"))
  E(net)$width <- apply(get.edgelist(net), 1, function(x) 
  ifelse(sp.ind[x[1]] == sp.ind[x[2]], 1, 0.5))
  plot(net, vertex.size = 3, vertex.label = NA, layout = 
  layout.circle, main = date.index[pos[pos.plot[k]]])
  legend("bottomright", c("Materials", "Tele. Services"), 
  pch = 21, pt.bg = rainbow(2), cex = 0.6)
  legend("bottomleft", c("within sector", 
  "cross sector"), lwd = c(1, 0.4), col = c("black", 
  "gray"), cex = 0.6)
}



