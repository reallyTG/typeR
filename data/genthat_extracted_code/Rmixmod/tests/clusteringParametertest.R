library(Rmixmod);

createGaussianParameter <- function(nbCluster, pbDimension){
    proportions <- rep(1.0/nbCluster, nbCluster);
    means <- matrix(rep(0, nbCluster*pbDimension), nrow=nbCluster,
          ncol=pbDimension);
    for(k in 1:nbCluster){
        for(p in 1:pbDimension){
              means[k,p] = k;
        }
    }   
    variances <- list(c(1:nbCluster))
    for(k in 1:nbCluster){
        variances[[k]] <- diag(pbDimension)
    }   
    par <- new("GaussianParameter",proportions=proportions,
    mean=means, variance=variances);
    return(par);
}

data(iris)
data <- iris[,1:4]

param <- createGaussianParameter(3,4);

strategy <- mixmodStrategy(initMethod="parameter", parameter=param)
out <- mixmodCluster(data=data, nbCluster=3 , strategy=strategy);
