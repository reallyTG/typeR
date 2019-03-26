library(gmnl)


### Name: AIC.gmnl
### Title: Akaike's Information Criterion
### Aliases: AIC.gmnl BIC.gmnl

### ** Examples


## Estimate MNL model
data("TravelMode", package = "AER")
library(mlogit)
TM <- mlogit.data(TravelMode, choice = "choice", shape = "long", 
                 alt.levels = c("air", "train", "bus", "car"), chid.var = "individual")
                 
mnl <- gmnl(choice ~ wait + vcost + travel + gcost | 0 , data = TM)
AIC(mnl)
BIC(mnl)



