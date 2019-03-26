library(Rmixmod);
data(iris)
data <- iris[,1:4]

mixmodCluster(data, nbCluster=c(2,3,4));
