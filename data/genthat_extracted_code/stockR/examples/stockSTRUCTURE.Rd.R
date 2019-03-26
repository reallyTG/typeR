library(stockR)


### Name: stockSTRUCTURE
### Title: Finds stock structure for sampling groups of animals
### Aliases: stockSTRUCTURE

### ** Examples

## No test: 
set.seed(727)
tmpDat1 <- sim.stock.data( nAnimals=100, nSNP=5000, nSampleGrps=100, K=3, ninform=5000, 
                                    sds=c(alpha=1.6,beta.inform=0.75,beta.noise=0.0005))
#This should not be too challenging as stock differentiation is quite large.
print( calcFst( tmpDat1, attributes( tmpDat1)$grps))
#EM estimation from Kmeans starting values
tmp <- stockSTRUCTURE( tmpDat1, sample.grps=attr(tmpDat1,"sampleGrps"), K=3, start.grps=NULL)
#an easy gold-standard for simulations (only know starting values as this is simulated data)
tmp1 <- stockSTRUCTURE( tmpDat1, sample.grps=attr(tmpDat1,"sampleGrps"), K=3, 
                      start.grps=attr( tmpDat1,"grps"), control=list( method="EM"))
#an easily misled estimation method
tmp2 <- stockSTRUCTURE( tmpDat1, sample.grps=attr(tmpDat1,"sampleGrps"), K=3, 
                                              start.grps=NULL, control=list( method="EM"))
#combine into a single object to investigate results
grpings <- cbind( attributes( tmpDat1)$grps, apply( tmp$postProbs, 1, which.max), 
              apply( tmp2$postProbs, 1, which.max), apply( tmp1$postProbs, 1, which.max))
colnames( grpings) <- c("True","Kmeans.EM Estimated","EM Estimated","Estimated From TRUE Start")
print( "How did we go with the stock identification?")
print( grpings)
#up to label switching this looks good, except for the EM from random start method (a few 
#confused individuals for the second and thrid stocks)
## End(No test)



