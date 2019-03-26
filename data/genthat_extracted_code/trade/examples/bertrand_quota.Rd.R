library(trade)


### Name: bertrand_quota
### Title: quota Simulation With A Bertrand Pricing Game
### Aliases: bertrand_quota

### ** Examples

## Calibration and simulation results from a 80% quota on non-US beers "OTHER-LITE"
## and "OTHER-REG"
## Source: Epstein/Rubenfeld 2004, pg 80

prodNames <- c("BUD","OLD STYLE","MILLER","MILLER-LITE","OTHER-LITE","OTHER-REG")
owner <-c("BUD","OLD STYLE","MILLER","MILLER","OTHER-LITE","OTHER-REG")
price    <- c(.0441,.0328,.0409,.0396,.0387,.0497)
quantities   <- c(.066,.172,.253,.187,.099,.223)*100
margins <- c(.3830,.5515,.5421,.5557,.4453,.3769)
quota <- c(Inf,Inf,Inf,Inf,.8,.8)

names(price) <-
 names(quantities) <-
 names(margins) <-
 prodNames


result.logit <- bertrand_quota(demand = "logit",prices=price,quantities=quantities,
                                margins = margins,owner=owner, quotaPost = quota, labels=prodNames)

print(result.logit)           # return predicted price change
summary(result.logit)         # summarize merger simulation



