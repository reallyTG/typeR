library(linkspotter)


### Name: linkspotterComplete
### Title: Linspotter complete runner
### Aliases: linkspotterComplete

### ** Examples

# run linkspotter on iris example data
data(iris)
lsOutputIris<-linkspotterComplete(iris)
summary(lsOutputIris)
## Not run: 
##D # launch the UI
##D lsOutputIris$launchShiny(option=list(port=8000))
## End(Not run)




