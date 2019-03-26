library(kyotil)


### Name: age_calc
### Title: Age Calculation
### Aliases: age_calc

### ** Examples


age_calc (dob=strptime("29OCT2002", format="%d%b%Y"), 
    enddate=strptime("30OCT2003", format="%d%b%Y"), units='years', precise=TRUE)
age_calc (dob=strptime("29OCT2002", format="%d%b%Y"), 
    enddate=strptime("30DEC2003", format="%d%b%Y"), units='years', precise=FALSE)




