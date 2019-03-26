library(eyelinker)


### Name: %In%
### Title: Find if value belongs to a set of intervals
### Aliases: %In%

### ** Examples

start <- c(0,1,2)
end <- c(.5,1.3,3)
intv <- cbind(start,end) #The first interval is 0-0.5, second is 1-1.3, etc. 
c(0,.6,1.5,3) %In% intv



