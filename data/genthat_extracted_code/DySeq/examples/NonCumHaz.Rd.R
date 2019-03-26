library(DySeq)


### Name: NonCumHaz
### Title: NonCumHaz
### Aliases: NonCumHaz

### ** Examples


# Example 1: Short artificial data
# example cumulated hazard with time referenz
cumhaz<-c(0.2 ,0.21 ,0.31 ,0.44 ,1.1  ,1.1  ,1.12 ,1.2)
time<-c(4     ,5    ,6    ,7    ,10   ,14   ,15   ,16)

NonCumHaz(cumhaz, time, plot=TRUE)



# Example 2: Every hazard entry represents one point of time

# if every hazard entry repesents one point of time
NonCumHaz(cumhaz, 1:8, plot=TRUE)



# Example 3: real data and real researchquestion
## Not run: 
##D #install.packages("survival") 
##D library(survival)
##D 
##D # How long till the last stress signal
##D my.last<-LastOccur(CouplesCope[,50:97],1)
##D 
##D # If last stress signal was in time intervall 48,
##D # stress did not end till the observation duration
##D event<-rep(1,length(my.last))
##D event[my.last==48]<-0
##D 
##D # Coxregression
##D my.surv<-Surv(my.last,event) # creates a object for survival time analysis
##D my.fit<-survfit(coxph(my.surv~1)) # fits coxregression without covariates on the data
##D 
##D plot(my.fit) # survival curve
##D plot(my.fit, fun="cumhaz") # cumulated survival curve
##D 
##D # Different uses for NonCumHaz
##D NonCumHaz(my.fit, plot=TRUE)
##D NonCumHaz(my.fit$cumhaz, my.fit$time, plot=TRUE) # if over packages than 'survival'are used
## End(Not run)




