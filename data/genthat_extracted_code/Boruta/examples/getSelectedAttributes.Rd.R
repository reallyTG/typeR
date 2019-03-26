library(Boruta)


### Name: getSelectedAttributes
### Title: Extract names of the selected attributes
### Aliases: getSelectedAttributes

### ** Examples

## Not run: 
##D data(iris)
##D #Takes some time, so be patient
##D Boruta(Species~.,data=iris,doTrace=2)->Bor.iris
##D print(Bor.iris)
##D print(getSelectedAttributes(Bor.iris))
## End(Not run)



