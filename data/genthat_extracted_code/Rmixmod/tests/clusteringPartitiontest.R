library(Rmixmod);
data(iris)
data <- iris[,1:4]

labels <- c(rep(1,40),rep(2,70),rep(3,40))

#strategy = new("Strategy", initMethod="partition", labels=labels)
strategy = mixmodStrategy(initMethod="label", labels=labels)

out <- mixmodCluster(data, nbCluster=3, strategy=strategy);
