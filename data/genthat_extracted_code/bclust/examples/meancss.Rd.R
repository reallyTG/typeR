library(bclust)


### Name: meancss
### Title: computes statistics necessary for the evaluation of the log
###   likelihood
### Aliases: meancss

### ** Examples

data(gaelle)
gaelle.id<-rep(1:14,c(3,rep(4,13))) 
# first 3 rows replication of ColWT, 4 for the rest
mc.gaelle<-meancss(gaelle,gaelle.id)
loglikelihood(x.mean=mc.gaelle$mean,x.css=mc.gaelle$css,
repno=mc.gaelle$repno,transformed.par=rep(0,6)) 
# evalutes likelihood at rep(0,6)



