library(HIest)


### Name: Cline.fit
### Title: Fit alternative cline functions to data from one or more genetic
###   loci.
### Aliases: Cline.fit
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
data(Bluestone)
BS.fit <- Cline.fit(Bluestone[,1:12],model=c("logit.logistic","Barton"))
Cline.plot(BS.fit)




