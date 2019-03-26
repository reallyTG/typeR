library(mets)


### Name: count.history
### Title: Counts the number of previous events of two types for recurrent
###   events processes
### Aliases: count.history

### ** Examples

########################################
## getting some rates to mimick 
########################################

data(base1cumhaz)
data(base4cumhaz)
data(drcumhaz)
dr <- drcumhaz
base1 <- base1cumhaz
base4 <- base4cumhaz

######################################################################
### simulating simple model that mimicks data 
### now with two event types and second type has same rate as death rate
######################################################################

rr <- simRecurrentII(1000,base1,dr,death.cumhaz=base4)
rr <-  count.history(rr)
dtable(rr,~"Count*"+status,level=1)




