library(nimble)


### Name: simNodesMV
### Title: Basic nimbleFunctions for using a NIMBLE model with sets of
###   stored values
### Aliases: calcNodesMV getLogProbNodesMV simNodesMV

### ** Examples

code <- nimbleCode({
for(i in 1:5)
x[i] ~ dnorm(0,1)
})

myModel <- nimbleModel(code)
myMV <- modelValues(myModel)

Rsim <- simNodesMV(myModel, myMV)
Rcalc <- calcNodesMV(myModel, myMV)
Rglp <- getLogProbNodesMV(myModel, myMV)
## Not run: 
##D   cModel <- compileNimble(myModel)
##D   Csim <- compileNimble(Rsim, project = myModel)
##D   Ccalc <- compileNimble(Rcalc, project = myModel)
##D   Cglp <- compileNimble(Rglp, project = myModel)
##D   Csim$run(10)
##D   Ccalc$run(saveLP = TRUE)
##D   Cglp$run()	#Gives identical answers to Ccalc because logProbs were saved
##D   Csim$run(10)
##D   Ccalc$run(saveLP = FALSE)
##D   Cglp$run()	  #Gives wrong answers because logProbs were not saved
## End(Not run)



