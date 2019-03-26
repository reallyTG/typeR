library(fastNaiveBayes)


### Name: fastNaiveBayes.gaussian
### Title: Fast Naive Bayes Classifier with a Gaussian event model
### Aliases: fastNaiveBayes.gaussian fastNaiveBayes.gaussian.default

### ** Examples

    rm(list=ls())
    require(mlbench)
    require(Matrix)

    # Load BreastCancer data
    data(BreastCancer)
    dim(BreastCancer)
    levels(BreastCancer$Class)
    head(BreastCancer)

    # Gaussian distribution example
    data_mat <- BreastCancer[,c("Class","Cl.thickness","Cell.size","Cell.shape","Marg.adhesion")]

    y <- data_mat[,"Class"]
    data_mat <- data_mat[,setdiff(colnames(data_mat),c("Class"))]
    for(i in 1:ncol(data_mat)){
      data_mat[[i]] <- as.numeric(data_mat[[i]])
    }

    model <- fastNaiveBayes.gaussian(data_mat[1:400,], y[1:400], laplace = 1, sparse = FALSE)
    preds <- predict(model, newdata = data_mat[401:nrow(data_mat),], type = "class")

    mean(preds!=y[401:length(y)])




