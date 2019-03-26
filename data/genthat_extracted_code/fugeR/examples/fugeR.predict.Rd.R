library(fugeR)


### Name: fugeR.predict
### Title: Compute the prediction of a fuzzy system for the given input
###   data.
### Aliases: fugeR.predict

### ** Examples
##
##
## Not run: 
##D #We use the iris dataset for this example
##D #We need to convert the output in a numeric format.
##D data(iris)
##D OUT <- data.matrix(iris[5])[,1]
##D fIris <- cbind(iris[1:4], OUT)
##D In <- fIris[1:4]
##D Out <- fIris[5]
##D 
##D #Launch the evolution, fugeR.run will return
##D #the best fuzzy system found during the evolution
##D fuzzySystem  <- fugeR.run( In,
##D                    Out,
##D                    generation=100, # Increase the number of generation for a better accuracy
##D                    population=100,
##D                    elitism=20,
##D                    verbose=TRUE,
##D                    threshold=NA,
##D                    sensiW=0.0,
##D                    speciW=0.0,
##D                    accuW=0.0,
##D                    rmseW=1.0,
##D                    maxRules=5,
##D                    maxVarPerRule=2,
##D                    labelsMf=3
##D )
##D 
##D #Plot the predicton given by the best fuzzy system found during the evolution
##D prediction <- fugeR.predict(fuzzySystem, In)
##D plot(prediction[[1]], ylim=c(1,max(unlist(Out))), col='blue', pch=21, axes=FALSE, ann=FALSE)
##D points(Out[[1]], col="red", pch=21)
##D axis(1)
##D axis(2, at=1:3, lab=c('setosa', 'versicolor', 'virginica'))
##D title(main='Fuzzy system prediction on Iris problem')
##D title(xlab="Cases")
##D title(ylab="Specie")
##D box()
##D legend(0.0, 3.0, c("Predicted","Actual"), cex=0.8, 
##D        col=c("blue","red"), pch=c(21,21))
##D 
##D #Display the fuzzy system
##D fugeR.summary(fuzzySystem)
## End(Not run)


