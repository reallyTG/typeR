library(HIest)


### Name: Cline.plot
### Title: Graph genomic clines fit to data
### Aliases: Cline.plot
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
data(Bluestone)
BS.fit <- Cline.fit(Bluestone[,1:12],model=c("logit.logistic","Barton"))
Cline.plot(BS.fit)




