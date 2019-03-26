library(languageR)


### Name: lexicalMeasuresClasses
### Title: Classification of lexical measures
### Aliases: lexicalMeasuresClasses
### Keywords: datasets

### ** Examples
## Not run: 
##D library(cluster)
##D data(lexicalMeasures)
##D data(lexicalMeasuresClasses)
##D 
##D lexicalMeasures.cor = cor(lexicalMeasures[,-1], method = "spearman")^2
##D x = data.frame(measure = rownames(lexicalMeasures.cor), 
##D cluster = cutree(diana(dist(lexicalMeasures.cor)), 5),
##D class = lexicalMeasuresClasses$Class)
##D x = x[order(x$cluster), ]
##D x
## End(Not run)


