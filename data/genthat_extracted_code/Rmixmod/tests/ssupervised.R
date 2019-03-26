library(Rmixmod);
data(iris)
data <- iris[,1:4]
labels <- ifelse(iris[5]=='virginica',3,ifelse(iris[5]=='versicolor',2,1))
rand <-sample(c(rep(1,each=50),rep(0,each=100)))
kl <- labels*rand
mixmodCluster(data, nbCluster=3, knownLabels=kl);