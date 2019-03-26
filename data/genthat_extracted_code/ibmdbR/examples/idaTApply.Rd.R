library(ibmdbR)


### Name: idaTApply
### Title: Apply R-function to subsets of IDA data frame
### Aliases: idaTApply

### ** Examples

## Not run: 
##D #Create an ida data frame from the iris data
##D idf <- as.ida.data.frame(iris)
##D 
##D #Define a function that computes the mean value for every column of a data frame x
##D #except the index column.
##D #It returns a data frame with the value of the index column and the mean values.
##D columnMeans<- function(x, index) {
##D        cbind(index=x[1,match(index, names(x))],
##D               as.data.frame(as.list(apply(x[,names(x) != index],2,mean))))}
##D 
##D 
##D #Apply the columnMeans function to the subsets of the iris data identified by the Species column
##D resSig <- list(Species="VARCHAR(12)", MSepalLength="DOUBLE", MSepalWidth="DOUBLE",
##D                                        MPetalLength="DOUBLE", MPetalWidth="DOUBLE")
##D resDf <-
##D   idaTApply(idf, "Species", FUN=columnMeans, output.name="IRIS_MEANS", output.signature=resSig)
##D 
##D #It is possible as well to apply an anonymous function.
##D #The value "5" of the second parameter designates the position of the "Species" column
##D #in the idf ida.data.frame.
##D #The output table of the previous call is recreated because of the "clear.existing=T" parameter.
##D resDf <- idaTApply(idf, 5,
##D                    FUN=function(x, index) {
##D                               cbind(index=x[1,match(index, names(x))],
##D                                      as.data.frame(as.list(apply(x[,names(x) != index],2,mean))))},
##D                    output.name="IRIS_MEANS", output.signature=resSig, clear.existing=T)
##D 
##D #Apply the columnMeans2 function which has an additional parameter "columns"
##D #to specify the columns for which the mean values are computed
##D columnMeans2 <- function(x, index, columns) {
##D        cbind(index=x[1,match(index, names(x))],
##D               as.data.frame(as.list(apply(x[,names(x) != index & names(x) %in% columns],2,mean))))}
##D petalColumns <- c("PetalLength", "PetalWidth")
##D resSig2 <- list(Species="VARCHAR(12)", MPetalLength="DOUBLE", MPetalWidth="DOUBLE")
##D resDf2 <- idaTApply(idf, "Species", FUN=columnMeans2, output.name="IRIS_MEANS2",
##D                     output.signature=resSig2, clear.existing=T, columns=petalColumns)
## End(Not run)



