library(nimble)


### Name: nimCopy
### Title: Copying function for NIMBLE
### Aliases: copy nimCopy

### ** Examples

# Building model and modelValues object
simpleModelCode <- nimbleCode({
for(i in 1:100)
	x[i] ~ dnorm(0,1)
})
rModel <- nimbleModel(simpleModelCode)
rModelValues <- modelValues(rModel)

#Setting model nodes
rModel$x <- rnorm(100)
#Using nimCopy in R.
nimCopy(from = rModel, to = rModelValues, nodes = 'x', rowTo = 1)

#Use of nimCopy in a simple nimbleFunction
cCopyGen <- nimbleFunction(
	setup = function(model, modelValues, nodeNames){},
	run = function(){
		nimCopy(from = model, to = modelValues, nodes = nodeNames, rowTo = 1)
	}
)

rCopy <- cCopyGen(rModel, rModelValues, 'x')
## Not run: 
##D cModel <- compileNimble(rModel)
##D cCopy <- compileNimble(rCopy, project = rModel)
##D cModel[['x']] <- rnorm(100)
##D 
##D cCopy$run() ## execute the copy with the compiled function
## End(Not run)



