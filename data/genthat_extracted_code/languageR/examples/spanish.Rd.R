library(languageR)


### Name: spanish
### Title: Relative frequencies of tag trigrams is selected Spanish texts
### Aliases: spanish
### Keywords: datasets

### ** Examples
## Not run: 
##D data(spanish)
##D data(spanishMeta)
##D 
##D # principal components analysis
##D 
##D spanish.t = t(spanish)
##D spanish.pca = prcomp(spanish.t, center = TRUE, scale = TRUE)
##D spanish.x = data.frame(spanish.pca$x)
##D spanish.x = spanish.x[order(rownames(spanish.x)), ]
##D 
##D library(lattice)
##D splom(~spanish.x[ , 1:3], groups = spanishMeta$Author)
##D 
##D # linear discriminant analysis
##D 
##D library(MASS)
##D spanish.pca.lda = lda(spanish.x[ , 1:8], spanishMeta$Author)
##D plot(spanish.pca.lda)
##D 
##D # cross-validation
##D 
##D n = 8
##D spanish.t = spanish.t[order(rownames(spanish.t)), ]
##D predictedClasses = rep("", 15)
##D for (i in 1:15) {
##D   training = spanish.t[-i,]                     
##D   trainingAuthor = spanishMeta[-i,]$Author
##D   training.pca = prcomp(training, center=TRUE, scale=TRUE)
##D   training.x = data.frame(training.pca$x)
##D   training.x = training.x[order(rownames(training.x)), ]
##D   training.pca.lda = lda(training[ , 1:n], trainingAuthor)
##D   predictedClasses[i] = 
##D   as.character(predict(training.pca.lda, spanish.t[ , 1:n])$class[i])  
##D }
##D 
##D ncorrect = sum(predictedClasses==as.character(spanishMeta$Author))
##D ncorrect
##D sum(dbinom(ncorrect:15, 15, 1/3))
## End(Not run)


