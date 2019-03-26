library(fastNaiveBayes)


### Name: fastNaiveBayes.bernoulli
### Title: Fast Naive Bayes Classifier with a Bernoulli event model
### Aliases: fastNaiveBayes.bernoulli fastNaiveBayes.bernoulli.default

### ** Examples

    rm(list=ls())
    require(mlbench)
    require(Matrix)

    # Load BreastCancer data
    data(BreastCancer)
    dim(BreastCancer)
    levels(BreastCancer$Class)
    head(BreastCancer)

    # Bernoulli dummy example
    data_mat <- BreastCancer[,c("Class","Cl.thickness","Cell.size","Cell.shape","Marg.adhesion")]
    col_counter <- ncol(data_mat)+1
    for(i in 2:ncol(data_mat)){
      for(val in unique(data_mat[,i])){
        data_mat[,col_counter] <- ifelse(data_mat[,i]==val,1,0)
        col_counter <- col_counter+1
      }
    }

    y <- data_mat[,"Class"]
    data_mat <- data_mat[,setdiff(colnames(data_mat),c("Class","Cl.thickness", "Cell.size",
                                                       "Cell.shape","Marg.adhesion"))]
    data_mat <- as.matrix(data_mat)

    model <- fastNaiveBayes.bernoulli(data_mat[1:400,], y[1:400], laplace = 1, sparse = TRUE)
    preds <- predict(model, newdata = data_mat[401:nrow(data_mat),], type = "class")

    mean(preds!=y[401:length(y)])




