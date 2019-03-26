library(mets)


### Name: simRecurrent
### Title: Simulation of recurrent events data based on cumulative hazards
### Aliases: simRecurrent showfitsim simRecurrentGamma covIntH1dM1IntH2dM2
###   recurrentMarginalgam squareintHdM addCums

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
 ######################################################################
 rr <- simRecurrent(5,base1,death.cumhaz=dr)
 dlist(rr,.~id,n=0)

 rr <- simRecurrent(1000,base1,death.cumhaz=dr)
 par(mfrow=c(1,3))
 showfitsim(causes=1,rr,dr,base1,base1)

######################################################################
### simulating simple model that mimicks data 
### now with two event types and second type has same rate as death rate
######################################################################

 rr <- simRecurrent(1000,base1,death.cumhaz=dr,cumhaz2=base4)
 dtable(rr,~death+status)
 par(mfrow=c(2,2))
 showfitsim(causes=2,rr,dr,base1,base4)

######################################################################
### simulating simple model 
### random effect for all causes (Z shared for death and recurrent) 
######################################################################

 rr <- simRecurrent(1000,base1,
        death.cumhaz=dr,dependence=1,var.gamma=0.4)
 ### marginals do fit after input after integrating out
 par(mfrow=c(2,2))
 showfitsim(causes=1,rr,dr,base1,base1)




