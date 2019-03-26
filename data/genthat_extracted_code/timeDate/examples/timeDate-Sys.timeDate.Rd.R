library(timeDate)


### Name: Sys.timeDate
### Title: System Time as 'timeDate' Object
### Aliases: Sys.timeDate
### Keywords: chron

### ** Examples

## Sys.time -

   # direct
   Sys.timeDate()  
   
   # transformed from "POSIX(c)t"         
   timeDate(Sys.time()) 
 
   # Local Time in Zurich
   timeDate(Sys.time(), FinCenter = "Zurich")  



