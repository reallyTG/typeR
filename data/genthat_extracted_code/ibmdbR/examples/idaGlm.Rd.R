library(ibmdbR)


### Name: idaGlm
### Title: Generalized Linear Models (GLM)
### Aliases: idaGlm print.idaGlm predict.idaGlm

### ** Examples

## Not run: 
##D #Add isSetosa column to iris data frame
##D iris2 <- iris
##D iris2$isSetosa <- ifelse(iris2$Species=="setosa", 1, 0)
##D 
##D #Store the iris2 data frame in the IRIS2 table
##D idf <-as.ida.data.frame(iris2, table="IRIS2", clear.existing=T, rownames="ID")
##D 
##D #Calculate GLM model in-db
##D glm <- idaGlm(isSetosa~PetalLength+SepalLength*SepalWidth+PetalWidth, idf, id="ID")
##D 
##D #Print the model
##D print(glm)
##D 
##D #Apply the model to data
##D idf2 <- predict(glm, idf, "ID")
##D 
##D #Inspect the results
##D head(idf2)
##D 
## End(Not run)


