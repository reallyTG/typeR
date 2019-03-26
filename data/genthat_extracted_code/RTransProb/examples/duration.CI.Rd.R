library(RTransProb)


### Name: duration.CI
### Title: Bootstrapped confidence intervals - Duration
### Aliases: duration.CI

### ** Examples

## Not run: 
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D method       <- "duration" 
##D snapshots <- 4
##D interval  <-  0
##D Example1  <-getPIT(data,startDate, endDate,method, snapshots, interval)
##D 
##D lstInit <- Example1$lstInitVec[lapply(Example1$lstInitVec,length)>0]
##D lstCnt <-  Example1$lstCntMat[lapply(Example1$lstCntMat,length)>0]
##D ExampleTTC1<-duration.TTC(Example1$lstCntMat,Example1$lstInitVec)
##D 
##D 
##D genMat   <- ExampleTTC1$WGM
##D portWgts <- ExampleTTC1$SWFY[,1]
##D nHorizon <- length(ExampleTTC1$UUPTM[[1]])
##D sim      <- 100
##D 
##D tolerance_Duration <- duration.CI(genMat,portWgts,nHorizon,sim)
## End(Not run)




