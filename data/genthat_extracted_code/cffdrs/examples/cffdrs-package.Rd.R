library(cffdrs)


### Name: cffdrs-package
### Title: Canadian Forest Fire Danger Rating System
### Aliases: cffdrs-package cffdrs
### Keywords: package

### ** Examples

#Calculating daily FWI with wintering DC 

#This exercise demonstrates how to calculate daily FWI System variables given a chronical two years
# daily fire weather observations from one weather station. In the example, we showed first how to 
# decide fire season start and end dates with fireSeason, we then made overwintering DC adjustment
# with wDC for the second fire season, and eventually calculated the daily FWI System variables over
# two fire seasons with fwi.  All these steps were packed up into an example user's function, which 
# could be modified by various user groups. Note: the data used in this example is also the test
# data for wDC.
library(cffdrs)

#Example of a customised function to calculate fwi and 
#overwinter DC. This could be further modified by 
#users with various needs.
fwi_fs_wDC <- function(input){
  all.fwi <- NULL
  curYr.fwi <- NULL
  #Create date variable
  input$date <- as.Date(as.POSIXlt(paste(input$yr, "-", input$mon, "-", input$day,sep="")))
  
  #use default fire season start and end temperature thresholds
  fs <- fireSeason(input)
  #Fire season dates, ordered chronologically
  fs <- with(fs,fs[order(yr,mon,day),])
  #Create same Date format as weather dataset for comparison
  fs$date <- as.Date(as.POSIXlt(paste(fs$yr,"-",fs$mon,"-",fs$day,sep="")))

  theyears <- unique(fs$yr)
  
  for(curYr.row in 1:length(theyears)){
    #curYr.row <- 2
    curYr <- theyears[curYr.row]
    curYr.d <- fs[fs$yr==curYr,]
    curYr.init <- data.frame(ffmc=80,dmc=10,dc=16) #set an initial startup values
    
    #if there is more than one year of data, accumulate precipitation, then calculate overwinterDC
    #and continue
    if(curYr.row > 1){
      #calculate the overwinter period
      #end of last year's fire season
      curYr.owd <- curYr.fsd[nrow(curYr.fsd),]
      #rbind with beginning of current year's fire season
      curYr.owd <- rbind(curYr.owd, curYr.d[1,])
      
      #accumulate precipitation for the period between end of last and start of current
      curYr.owdata <- sum(input[(input$date>curYr.owd[1,"date"] & 
                          input$date < curYr.owd[2,"date"]),]$prec)
      owDC <- wDC(DCf=tail(curYr.fwi$DC,n=1),rw=curYr.owdata) #calculate overwinter DC value
      curYr.init <- data.frame(ffmc=80,dmc=10,dc=owDC) #Initialize moisture codes
    }    
    
    curYr.fsd <- curYr.d[c(1,nrow(curYr.d)),]#get first and last dates of this year
    #match input data to those dates for fire season data
    curYr.fsdata <- input[input$yr == curYr & input$date >= curYr.fsd[1,"date"] & 
                          input$date <= curYr.fsd[2,"date"],]
    
    #run fwi on fireseason data
    curYr.fwi <- fwi(curYr.fsdata,init=curYr.init)
    #force column names to be uppercase for consistency
    names(curYr.fwi) <- toupper(names(curYr.fwi))
    all.fwi <- rbind(all.fwi,curYr.fwi)
  }
  all.fwi
}

##Usage of the custom function
# Load the test dataset, which is also the test data for wDC:
data("test_wDC")
#select 1 weather station
localWX_1 <- test_wDC[test_wDC$id==1,]
#run function with the data and fire season values
fwi_withFSwDC <- fwi_fs_wDC(localWX_1)
#Check the resulting fwi indices, calculated with a fire season start and end date, and using 
#overwintered DC
fwi_withFSwDC



