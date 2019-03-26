library(RTransProb)


### Name: cohort.CI
### Title: Bootstrapped confidence intervals - Cohort
### Aliases: cohort.CI

### ** Examples


## Not run: 
##D 
##D #Set parameters to generate PIT transition matrices
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
##D #use $ATMP from the cohort.TTC() as the input into the cohort.CI() function
##D transMatrix    <- ExampleTTC$ATMP
##D initCount      <- ExampleTTC$ACP[[1]][,1]
##D sim            <- 1000
##D tolerance_Cohort <-cohort.CI(transMatrix,initCount,sim)
##D 
##D 
##D 
##D Example 2:
##D #Set parameters to generate PIT transition matrices
##D startDate  <- "1997-01-01"
##D endDate    <- "2002-01-01"
##D method       <- "cohort"   
##D snapshots <- 12  
##D interval <-  1 
##D Example<-getPIT(data,startDate, endDate,method, snapshots, interval)
##D 
##D lstInit <- Example$lstInitVec[lapply(Example$lstInitVec,length)>0]
##D lstCnt <- Example$lstCntMat[lapply(Example$lstCntMat,length)>0]
##D ExampleTTC <- cohort.TTC(lstCnt,lstInit)
##D 
##D #use $ATMP from the cohort.TTC() as the input into the cohort.CI() function
##D transMatrix    <- ExampleTTC$ATMP
##D initCount      <- ExampleTTC$ACP[[1]][,1]
##D sim            <- 1000
##D tolerance_Cohort <-cohort.CI(transMatrix,initCount,sim)
## End(Not run)



