library(BayesVarSel)


### Name: predict.Bvs
### Title: Bayesian Model Averaged predictions
### Aliases: predict.Bvs

### ** Examples


## Not run: 
##D 
##D #Analysis of Crime Data
##D #load data
##D data(UScrime)
##D 
##D crime.Bvs<- Bvs(formula= y ~ ., data=UScrime, n.keep=1000)
##D #predict a future observation associated with the first two sets of covariates
##D crime.Bvs.predict<- predict(crime.Bvs, newdata=UScrime[1:2,], n.sim=10000)
##D #(Notice the best 1000 models are used in the mixture)
##D 
##D #Here you can use standard summaries to describe the underlying predictive distribution
##D #summary(crime.Bvs.predict)
##D #
##D #To study more in deep the first set:
##D plot(density(crime.Bvs.predict[,1]))
##D #Point prediction
##D median(crime.Bvs.predict[,1])
##D #A credible 95% interval for the prediction:
##D #lower bound:
##D quantile(crime.Bvs.predict[,1], probs=0.025)
##D #upper bound:
##D quantile(crime.Bvs.predict[,1], probs=0.975)
##D 
## End(Not run)




