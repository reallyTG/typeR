library(dynOmics)


### Name: plot.associations
### Title: Plot of 'associations' objects
### Aliases: plot.associations

### ** Examples

## Not run: 
##D data(Metabolites)
##D data(Transcripts)
##D associations <- associateData(Metabolites[,1:2],Transcripts[,c(1:100)])
##D #if you only define feature1 or feature2 if will plot all associations
##D plot(associations,Metabolites,Transcripts,feature1=1,withShift = TRUE)
##D #if you define feature1 and feature2 it will only plot these two profiles
##D plot(associations,Metabolites,Transcripts,feature1="Metabolite 1",feature2="Transcript 2")
## End(Not run)



