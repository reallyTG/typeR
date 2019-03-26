library(sensory)


### Name: CUUimpute
### Title: Cluster-Wise Imputation via a PEM Algorithm
### Aliases: CUUimpute
### Keywords: Clustering Imputation Expectation Maximization (EM) Algorithm
###   Parsimonious Gaussian Mixture Models CUU Model Sensory Informed
###   Designs

### ** Examples


### Example I
data(iiris) # loads the modified Iris data
head(iiris) # displays the first six rows of the modified Iris data
data(iris) # loads the original Iris data

# create a vectors whose elements contain the group memberships of each flower
iris.known <- as.integer(iris[,ncol(iris)])

# fit a three component CUU models to the modified Iris data
output <- CUUimpute(x=iiris,G=3,q=1,print=FALSE,known=iris.known)
output
summary(output) # Summarizes the results

names(output) # Shows what results are available
output$allbic # Gives every BIC value
output$bic # Gives BIC for best fitting model
output$G # Gives the number of components for the best fitting CUU model
output$loglik # Gives a vector whose elements are the log-likelihood at each iteration
output$gpar # Gives the model parameters for the best fitting CUU model
head(output$yhat) # Displays the first 6 rows of the imputed matrix
output$yhat # Gives the entire imputed matrix
output$class.table # Gives a classification table between the predicted and true group memberships



