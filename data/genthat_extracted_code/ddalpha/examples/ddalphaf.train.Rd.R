library(ddalpha)


### Name: ddalphaf.train
### Title: Functional DD-Classifier
### Aliases: ddalphaf.train
### Keywords: functional robust multivariate nonparametric classif

### ** Examples


## Not run: 
##D 
##D ## load the Growth dataset
##D dataf = dataf.growth()
##D 
##D learn = c(head(dataf$dataf, 49), tail(dataf$dataf, 34))
##D labels= c(head(dataf$labels, 49), tail(dataf$labels, 34)) 
##D test  = tail(head(dataf$dataf, 59), 10)    # elements 50:59. 5 girls, 5 boys
##D 
##D #cross-validate over the whole variants up to dimension 3
##D c1 = ddalphaf.train (learn, labels, classifier.type = "ddalpha", maxNumIntervals = 3)
##D 
##D classified1 = ddalphaf.classify(c1, test)
##D 
##D print(unlist(classified1))
##D print(c1$adc.args) 
##D 
##D # cross-validate over these two variants
##D c2 = ddalphaf.train (learn, labels, classifier.type = "ddalpha", 
##D                      adc.args = list(
##D                        list(instance = "avr", 
##D                             numFcn = 1, 
##D                             numDer = 2),
##D                        list(instance = "avr", 
##D                             numFcn = 0, 
##D                             numDer = 2)))
##D 
##D classified2 = ddalphaf.classify(c2, test)
##D 
##D print(unlist(classified2))
##D print(c2$adc.args) 
##D 
## End(Not run)



