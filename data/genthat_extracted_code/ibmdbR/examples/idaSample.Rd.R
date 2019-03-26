library(ibmdbR)


### Name: idaSample
### Title: Taking a random sample from a IDA data frame
### Aliases: idaSample

### ** Examples

## Not run: 
##D idf<-ida.data.frame('IRIS')
##D 
##D #Simple random sampling
##D df <- idaSample(idf,10)
##D 
##D #Stratified sample
##D df <- idaSample(idf,10,'Species')
##D 
## End(Not run)



