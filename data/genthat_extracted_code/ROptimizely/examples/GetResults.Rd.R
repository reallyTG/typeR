library(ROptimizely)


### Name: GetResults
### Title: Optimizely API to extract results of individual experiment
### Aliases: GetResults

### ** Examples

## Not run: 
##D # Extract results of a single experiment
##D # Assign token before getting results
##D # set_token('abcdefghihjklmnopqrs:54321')
##D # Default results
##D exp.df<-GetResults('123456')
##D 
##D # Change result type to gather results
##D exp.df<-GetResults('123456',result.type='results)
##D 
##D # Filter results by audience
##D exp.df<-GetResults('123456',audience.id='123141')
##D 
##D # filter results by dimension
##D 
##D exp.df<-GetResults('123456',dimension.id='456', dimension.value='state')
##D 
##D 
## End(Not run)



