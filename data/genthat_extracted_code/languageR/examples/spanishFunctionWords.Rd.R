library(languageR)


### Name: spanishFunctionWords
### Title: Relative frequencies of function words in selected Spanish texts
### Aliases: spanishFunctionWords
### Keywords: datasets

### ** Examples
## Not run: 
##D data(spanishFunctionWords)
##D data(spanishMeta)
##D 
##D # principal components analysis
##D 
##D spanishFunctionWords.t = t(spanishFunctionWords)
##D spanishFunctionWords.t = 
##D   spanishFunctionWords.t[order(rownames(spanishFunctionWords.t)), ]
##D spanishFunctionWords.pca = 
##D   prcomp(spanishFunctionWords.t, center = TRUE, scale = TRUE)
##D 
##D sdevs = spanishFunctionWords.pca$sdev^2
##D n = sum(sdevs/sum(sdevs)> 0.05) 
##D 
##D # linear discriminant analysis with cross-validation
##D 
##D library(MASS)
##D 
##D predictedClasses = rep("", 15)
##D for (i in 1:15) {
##D   training = spanishFunctionWords.t[-i,]                   
##D   trainingAuthor = spanishMeta[-i,]$Author
##D   training.pca = prcomp(training, center = TRUE, scale = TRUE)
##D   training.x = data.frame(training.pca$x)
##D   training.x = training.x[order(rownames(training.x)), ]
##D   training.pca.lda = lda(training[ , 1:n], trainingAuthor)
##D   cl = predict(training.pca.lda, spanishFunctionWords.t[,1:n])$class[i]
##D   predictedClasses[i] = as.character(cl)
##D }
##D 
##D ncorrect = sum(predictedClasses==spanishMeta$Author)
##D sum(dbinom(ncorrect:15, 15, 1/3))
## End(Not run)


