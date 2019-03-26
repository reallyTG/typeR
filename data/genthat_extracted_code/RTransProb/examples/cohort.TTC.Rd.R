library(RTransProb)


### Name: cohort.TTC
### Title: Cohort - Data Weighting and "TTC" Calculation
### Aliases: cohort.TTC

### ** Examples


## Not run: 
##D 
##D #Set parameters
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D method       <- "cohort"   
##D snapshots <- 4  
##D interval <-  .25
##D Example<-getPIT(data,startDate, endDate,method, snapshots, interval)
##D 
##D lstInit <- Example$lstInitVec[lapply(Example$lstInitVec,length)>0]
##D lstCnt <- Example$lstCntMat[lapply(Example$lstCntMat,length)>0]
##D ExampleTTC <- cohort.TTC(lstCnt,lstInit)
##D  
## End(Not run)



