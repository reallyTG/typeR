library(mlxR)


### Name: inlineModel
### Title: inline model
### Aliases: inlineModel

### ** Examples

## Not run: 
##D myModel1 <- inlineModel("
##D [LONGITUDINAL]
##D EQUATION:
##D f = 10*exp(-0.2*t)
##D ")
##D 
##D print(myModel1)
##D 
##D r <- simulx(model=myModel1, output=list(name="f", time=0:100))
##D 
##D myModel2 <- inlineModel("
##D [LONGITUDINAL]
##D EQUATION:
##D f = 10*exp(-0.2*t)
##D ", filename="random")
##D 
##D print(myModel2)
## End(Not run)



