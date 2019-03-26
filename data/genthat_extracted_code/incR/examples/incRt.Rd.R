library(incR)


### Name: incRt
### Title: Calculation of temperature average and variance for customised
###   time windows
### Aliases: incRt

### ** Examples

# loading example data
data(incR_procdata)

# calculation based on chosen times from 6am to 7pm and 7pm to 6am
incRt (data=incR_procdata, 
        temp.name="temperature",
        limits=c(6,19), 
        coor=NULL, 
        civil.twilight=FALSE, 
        activity.times=FALSE,
        time.zone=NULL)
        
# calculation based on activity times
incRt (data=incR_procdata, 
        temp.name="temperature", 
        limits=NULL, 
        coor=NULL, 
        civil.twilight=FALSE, 
        activity.times=TRUE,
        time.zone=NULL,
        time_column="time",             # extra argument needed for incRact
        vector.incubation="incR_score") # extra argument needed for incRact
        
# calculation based on civil twilight
incRt (data=incR_procdata, 
        temp.name="temperature",
        limits=NULL, 
        coor=c(42,0.89), 
        civil.twilight=TRUE, 
        activity.times=FALSE,
        time.zone="GMT")



