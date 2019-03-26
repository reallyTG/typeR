library(mets)


### Name: simRecurrentII
### Title: Simulation of recurrent events data based on cumulative hazards
###   II
### Aliases: simRecurrentII simRecurrentIII

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

 cor.mat <- corM <- rbind(c(1.0, 0.6, 0.9), c(0.6, 1.0, 0.5), c(0.9, 0.5, 1.0))

######################################################################
### simulating simple model that mimicks data 
### now with two event types and second type has same rate as death rate
######################################################################

rr <- simRecurrentII(1000,base1,base4,death.cumhaz=dr)
dtable(rr,~death+status)
par(mfrow=c(2,2))
showfitsim(causes=2,rr,dr,base1,base4)




