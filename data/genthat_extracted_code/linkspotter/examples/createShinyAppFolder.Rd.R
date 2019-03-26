library(linkspotter)


### Name: createShinyAppFolder
### Title: Ready-for-deployment shiny app folder creation
### Aliases: createShinyAppFolder

### ** Examples

data(iris)
lsOutputIris<-linkspotterComplete(iris)
lsShinyObject<-lsOutputIris$launchShiny()
tmpShinyFolder<-tempdir()
createShinyAppFolder(lsShinyObject,
folderName=file.path(tmpShinyFolder,"myIrisLinkspotterShinyApp1")
)
## Not run: 
##D # launch the shiny app
##D shiny::runApp(tmpShinyFolder)
## End(Not run)



