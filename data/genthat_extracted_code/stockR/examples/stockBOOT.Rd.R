library(stockR)


### Name: stockBOOT
### Title: Calculates bootstrap estimates of stockSTRUCTURE model
### Aliases: stockBOOT

### ** Examples

## No test: 
  ##This example will take a little while to run.
  #This should be very challenging as stock differentiation is non-existant (K=1).
  tmpDat1 <- sim.stock.data( nAnimals=100, nSNP=5000, nSampleGrps=100, K=1, ninform=5000, 
                                    sds=c(alpha=1.6,beta.inform=0.75,beta.noise=0.0005))
  #EM estimation from Kmeans starting values
  tmp <- stockSTRUCTURE( tmpDat1, sample.grps=attr(tmpDat1,"sampleGrps"), K=3, start.grps=NULL)
  tmpBOOT <- stockBOOT( tmp, B=100, mc.cores=4)
  print( round( apply( tmpBOOT$postProbs, FUN=quantile, MARGIN=1:2, probs=c(0.025,0.975))), 5)
  #Note that, in this case, the posterior probabilities are not very informative; they could
  #be anywhere between 0 and 1. There are likely to be a few individuals, of course, where 
  #they have a very low chance of belonging to a particular stock (and this is chance). There
  #may even some individuals that get assigned to a group with almost certainty.
  
## End(No test)



