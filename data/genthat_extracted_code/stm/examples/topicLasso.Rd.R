library(stm)


### Name: topicLasso
### Title: Plot predictions using topics
### Aliases: topicLasso

### ** Examples


## Not run: 
##D 
##D #Load the poliblog data
##D data(poliblog5k)
##D #estimate a model with 50 topics
##D stm1 <- stm(poliblog5k.docs, poliblog5k.voc, 50,
##D             prevalence=~rating + blog, data=poliblog5k.meta,
##D             init.type="Spectral")
##D #make a plot of the topics most predictive of "rating"
##D out <- topicLasso(rating ~ 1, family="binomial", data=poliblog5k.meta,stmobj=stm1)
##D #generate some in-sample predictions
##D pred <- predict(out, newx=stm1$theta,type="class")
##D #check the accuracy of the predictions
##D table(pred, poliblog5k.meta$rating)
## End(Not run)



