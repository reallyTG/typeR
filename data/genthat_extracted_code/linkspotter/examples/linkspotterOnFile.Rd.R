library(linkspotter)


### Name: linkspotterOnFile
### Title: Proccess Linkspotter on an external file
### Aliases: linkspotterOnFile

### ** Examples

# run linkspotter on iris example data
data(iris)
tmpCSV<-tempfile(fileext = '.csv')
write.csv(iris, tmpCSV, row.names = FALSE)
lsOutputIrisFromFile<-linkspotterOnFile(file=tmpCSV)
summary(lsOutputIrisFromFile)
## Not run: 
##D # launch the UI
##D lsOutputIrisFromFile$launchShiny(options=list(port=8000))
## End(Not run)




