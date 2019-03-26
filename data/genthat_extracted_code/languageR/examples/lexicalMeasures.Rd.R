library(languageR)


### Name: lexicalMeasures
### Title: Lexical measures for 2233 English monomorphemic words
### Aliases: lexicalMeasures
### Keywords: datasets

### ** Examples
## Not run: 
##D data(lexicalMeasures)
##D data(lexicalMeasuresDist)
##D 
##D library(rms)
##D library(cluster)
##D plot(varclus(as.matrix(lexicalMeasures[,-1])))
##D 
##D lexicalMeasures.cor = cor(lexicalMeasures[,-1], method = "spearman")^2
##D lexicalMeasures.dist = dist(lexicalMeasures.cor)
##D pltree(diana(lexicalMeasures.dist))
##D 
##D data(lexicalMeasuresClasses)
##D x = data.frame(measure = rownames(lexicalMeasures.cor), 
##D cluster = cutree(diana(lexicalMeasures.dist), 5),
##D class = lexicalMeasuresClasses$Class)
##D x = x[order(x$cluster), ]
##D x
## End(Not run)


