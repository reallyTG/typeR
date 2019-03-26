library(ibmdbR)


### Name: idaNaiveBayes
### Title: Naive Bayes Classifier
### Aliases: idaNaiveBayes predict.idaNaiveBayes print.idaNaiveBayes

### ** Examples

## Not run: 
##D #Create ida data frame
##D idf <- ida.data.frame("IRIS")
##D 
##D #Create a naive bayes model
##D nb <- idaNaiveBayes(Species~SepalLength,idf,"ID")
##D 
##D #Print the model
##D print(nb)
##D 
##D #Apply the model to data
##D idf2 <- predict(nb,idf,"ID")
##D 
##D #Inspect the results
##D head(idf2)
##D 
## End(Not run)



