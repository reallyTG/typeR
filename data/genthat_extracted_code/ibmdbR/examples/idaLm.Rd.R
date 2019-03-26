library(ibmdbR)


### Name: idaLm
### Title: Linear regression
### Aliases: idaLm print.idaLm predict.idaLm plot.idaLm

### ** Examples

## Not run: 
##D #Create a pointer to table IRIS
##D idf <- ida.data.frame("IRIS")
##D 
##D #Calculate linear model in-db
##D lm1 <- idaLm(SepalLength~., idf)
##D 
##D library(ggplot2)
##D plot(lm1)
##D 
##D #Calculating linear models with categorical values requires an id column
##D lm1 <- idaLm(SepalLength~., idf, id="ID")
## End(Not run)



