library(ldbod)


### Name: ldbod
### Title: Local Density-Based Outlier Detection using Subsampling with
###   Approximate Nearest Neighbor Search
### Aliases: ldbod

### ** Examples

# 500 x 2 data matrix
X <- matrix(rnorm(1000),500,2)

# five outliers
outliers <- matrix(c(rnorm(2,20),rnorm(2,-12),rnorm(2,-8),rnorm(2,-5),rnorm(2,9)),5,2)
 X <- rbind(X,outliers)

# compute outlier scores without subsampling for all methods using neighborhood size of 50
scores <- ldbod(X, k=50)

head(scores$lrd); head(scores$rkof)

# plot data and highlight top 5 outliers retured by lof
plot(X)
top5outliers <- X[order(scores$lof,decreasing=TRUE)[1:5],]
points(top5outliers,col=2)

# plot data and highlight top 5 outliers retured by outlier score lpde
plot(X)
top5outliers <- X[order(scores$lpde,decreasing=FALSE)[1:5],]
points(top5outliers,col=2)

# compute outlier scores for k= 10,20 with 10% subsampling for methods 'lof' and 'lpdf'
scores <- ldbod(X, k = c(10,20), nsub = 0.10*nrow(X), method = c('lof','lpdf'))

# plot data and highlight top 5 outliers retuned by lof for k=20
plot(X)
top5outliers <- X[order(scores$lof[,2],decreasing=TRUE)[1:5],]
points(top5outliers,col=2)




