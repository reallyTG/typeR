library(RSAlgaeR)


### Name: climate.factor.effect
### Title: climate.factor.effect
### Aliases: climate.factor.effect

### ** Examples

data(estimatedrecord)
data(climatedata)
effectresults <- climate.factor.effect(wqrecord=estimatedrecord,imagedatecol="ImageDate",
valuecol="EstChlValue",climaterecord=climatedata,climatevarcol="TMAX",climatedatecol="DATE",
maxlag=7,noevent=16,months=c("July"))



