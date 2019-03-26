library(cvxclustr)


### Name: cvxclust
### Title: Convex Clustering Path via Variable Splitting Methods
### Aliases: cvxclust

### ** Examples

## Clusterpaths for Mammal Dentition
data(mammals)
X <- as.matrix(mammals[,-1])
X <- t(scale(X,center=TRUE,scale=FALSE))
n <- ncol(X)

## Pick some weights and a sequence of regularization parameters.
k <- 5
phi <- 0.5
w <- kernel_weights(X,phi)
w <- knn_weights(w,k,n)
gamma <- seq(0.0,43, length.out=100)

## Perform clustering
sol <- cvxclust(X,w,gamma)

## Plot the cluster path
library(ggplot2)
svdX <- svd(X)
pc <- svdX$u[,1:2,drop=FALSE]
pc.df <- as.data.frame(t(pc)%*%X)
nGamma <- sol$nGamma
df.paths <- data.frame(x=c(),y=c(), group=c())
for (j in 1:nGamma) {
  pcs <- t(pc)%*%sol$U[[j]]
  x <- pcs[1,]
  y <- pcs[2,]
  df <- data.frame(x=pcs[1,], y=pcs[2,], group=1:n)
  df.paths <- rbind(df.paths,df)
}
X_data <- as.data.frame(t(X)%*%pc)
colnames(X_data) <- c("x","y")
X_data$Name <- mammals[,1]
data_plot <- ggplot(data=df.paths,aes(x=x,y=y))
data_plot <- data_plot + geom_path(aes(group=group),colour='grey30',alpha=0.5)
data_plot <- data_plot + geom_text(data=X_data,aes(x=x,y=y,label=Name),
  position=position_jitter(h=0.125,w=0.125))
data_plot <- data_plot + geom_point(data=X_data,aes(x=x,y=y),size=1.5)
data_plot <- data_plot + xlab('Principal Component 1') + ylab('Principal Component 2')
data_plot + theme_bw()

## Output Cluster Assignment at 10th gamma
A <- create_adjacency(sol$V[[10]],w,n)
find_clusters(A)

## Visualize Cluster Assignment
G <- graph.adjacency(A, mode = 'upper')
plot(G,vertex.label=as.character(mammals[,1]),vertex.label.cex=0.65,vertex.label.font=2)



