library(RTransProb)


### Name: TransitionProb
### Title: Estimation of credit transition probabilities
### Aliases: TransitionProb

### ** Examples

## Not run: 
##D #Example 1:
##D #When start date and end date are not specified, the entire dataset is used and the package
##D #performs TTC calculations. Equally when snapshots and interval are not specified the defaults
##D #are 1.
##D snapshots <- 0
##D interval <- 0
##D startDate  <- 0
##D endDate    <- 0
##D Example1<-TransitionProb(dataTM,startDate,endDate,'cohort', snapshots, interval)
##D 
##D 
##D #Example 2:
##D #using the duration method the time window of interest are specified 2-year period from the
##D #beginning of 2000 to the beginning of 2002 snapshots and interval are not specified.
##D snapshots <- 0
##D interval <- 0
##D startDate  <- "2000-01-01"
##D endDate    <- "2002-01-01"
##D Example2<-TransitionProb(dataTM,startDate, endDate,'duration', snapshots, interval)
##D 
##D 
##D #Example 3:
##D #using the cohort method the time window of interest are specified 5-year period from the
##D #beginning of 2000 to the beginning of 2005 snapshots and interval are not specified.
##D snapshots <- 0
##D interval <- 0
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D Example3<-TransitionProb(dataTM,startDate, endDate,'cohort', snapshots, interval)
##D 
##D 
##D #Example 4:
##D #assume that the time window of interest is the 5-year period from the beginning of 2000 to
##D #the beginning of 2005. We want to estimate 1-year transition probabilities using quarterly
##D #snapshots using cohort method.
##D snapshots <- 4    #This uses quarterly transition matrices
##D interval <- 1    #This gives a 1 year transition matrix
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D Example4<-TransitionProb(dataTM,startDate, endDate,'cohort', snapshots, interval)
##D 
##D 
##D #Example 5:
##D #assume that the time window of interest is the 5-year period from the beginning of 2000 to
##D #the beginning of 2005. We want to estimate a 2-year transition probabilities using quarterly
##D #snapshots using cohort method.
##D snapshots <- 4     #This uses quarterly transition matrices
##D interval <- 2     #This gives a 2 years transition matrix
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D Example5<-TransitionProb(dataTM,startDate, endDate,'cohort', snapshots, interval)
##D 
##D 
##D #Example 6:
##D #assume that the time window of interest is the 2-year period from the beginning of 2000 to
##D #the beginning of 2005. We want to estimate 1-year transition probabilities using quarterly
##D #snapshots using duration method.
##D snapshots <- 4    #This uses quarterly transition matrices
##D interval <- 1    #This gives a 1 year transition matrix
##D startDate  <- "2000-01-01"
##D endDate    <- "2002-01-01"
##D Example6<-TransitionProb(dataTM,startDate, endDate,'duration', snapshots, interval)
##D 
##D 
##D #Example 7:
##D #assume that the time window of interest is the 5-year period from the beginning of 2000 to
##D #the beginning of 2005. We want to estimate 1-year transition probabilities using monthly
##D #snapshots using cohort method.
##D snapshots <- 12    #This uses monthly transition matrices
##D interval <- 1    #This gives a 1 year transition matrix
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D Example7<-TransitionProb(dataTM,startDate, endDate,'cohort', snapshots, interval)
##D 
##D 
##D #Example 8:
##D #assume that the time window of interest is the 5-year period from the beginning of 2000 to
##D #the beginning of 2005. We want to estimate 1-year transition probabilities using annual
##D #snapshots using cohort method.
##D snapshots <- 1    #This uses annual transition matrices
##D interval <- 1    #This gives a 1 year transition matrix
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D Example8<-TransitionProb(dataTM,startDate, endDate,'cohort', snapshots, interval)
## End(Not run)




