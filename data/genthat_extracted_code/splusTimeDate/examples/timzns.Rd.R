library(splusTimeDate)


### Name: timeZoneR
### Title: Constructor Function for 'timeZoneR' Class
### Aliases: timeZoneR
### Keywords: chron

### ** Examples

timeZoneR() 
timeZoneR(offset=3*3600) 
# time zone with daylight time that changed to daylight time on the  
# last Sunday in April and last Sunday in September through 1989,  
# and then on the 1st Sunday in May and October thereafter.
# Each time change occurs at 2AM local standard time.
timeZoneR( offset = 3600, 
		  yearfrom=c( -1, 1990), yearto=c( 1989, -1 ),  
		  hasdaylight=c( TRUE, TRUE ), dsextra=c( 3600, 3600 ),  
		  monthstart=c( 4, 5 ), codestart=c( 2, 3 ),  
		  daystart=c( 0, 0 ), xdaystart=c(0,1), 
		  timestart=c( 2*3600, 2*3600 ),  
		  monthend=c( 9, 10 ), codeend=c( 2, 3 ),  
		  dayend=c( 0, 0 ), xdayend=c(0,1), 
		  timeend=c(2*3600, 2*3600)) 



