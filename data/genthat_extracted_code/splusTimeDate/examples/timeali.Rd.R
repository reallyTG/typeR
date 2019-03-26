library(splusTimeDate)


### Name: timeAlign
### Title: Alignment of Times
### Aliases: timeAlign
### Keywords: chron

### ** Examples

x <- timeDate(c("2/11/1992 22:34", "7/8/1995 08:32"),  
       format="%a %02m/%02d/%Y %02H:%02M") 
# move to beginning of month 
timeAlign(x,"months",direction=-1) 
# move to beginning of next month 
timeAlign(x,"months",direction=1) 
# move to next multiple of 3 hours 
timeAlign(x,"hours",3) 
# move to next Friday 
timeAlign(x,"weeks", week.align="Friday") 



