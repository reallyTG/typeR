library(ddalpha)


### Name: ddalphaf.classify
### Title: Classify using Functional DD-Classifier
### Aliases: ddalphaf.classify predict.ddalphaf
### Keywords: functional robust multivariate nonparametric classif

### ** Examples


## Not run: 
##D ## load the Growth dataset
##D dataf = dataf.growth()
##D 
##D learn = c(head(dataf$dataf, 49), tail(dataf$dataf, 34))
##D labels= c(head(dataf$labels, 49), tail(dataf$labels, 34)) 
##D test  = tail(head(dataf$dataf, 59), 10)    # elements 50:59. 5 girls, 5 boys
##D 
##D c = ddalphaf.train (learn, labels, classifier.type = "ddalpha")
##D 
##D classified = ddalphaf.classify(c, test)
##D 
##D print(unlist(classified))
##D 
## End(Not run)



