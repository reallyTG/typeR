library(event)


### Name: pbirth
### Title: Fit Overdispersed Count Data as a Birth Process
### Aliases: pbirth deviance.pbirth print.pbirth
### Keywords: models

### ** Examples

y <- rnbinom(100,2,0.6)
fr <- tabulate(y)
pbirth(fr, p=log(-log(0.7)), intensity="Poisson", type="series")
pbirth(fr, p=c(log(-log(0.7)),log(5)),
	intensity="negative binomial", type="series")
pbirth(fr, p=c(log(-log(0.7)),log(5),-1),
	intensity="gen negative binomial", type="series")



