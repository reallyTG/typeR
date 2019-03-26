library(trade)


### Name: bertrand_tariff
### Title: Tariff Simulation With A Bertrand Pricing Game
### Aliases: bertrand_tariff

### ** Examples

## Calibration and simulation results from a 10% tariff on non-US beers "OTHER-LITE"
## and "OTHER-REG"
## Source: Epstein/Rubenfeld 2004, pg 80

prodNames <- c("BUD","OLD STYLE","MILLER","MILLER-LITE","OTHER-LITE","OTHER-REG")
owner <-c("BUD","OLD STYLE","MILLER","MILLER","OTHER-LITE","OTHER-REG")
price    <- c(.0441,.0328,.0409,.0396,.0387,.0497)
quantities   <- c(.066,.172,.253,.187,.099,.223)*100
margins <- c(.3830,.5515,.5421,.5557,.4453,.3769)
tariff <- c(0,0,0,0,.1,.1)

names(price) <-
 names(quantities) <-
 names(margins) <-
 prodNames


result.logit <- bertrand_tariff(demand = "logit",prices=price,quantities=quantities,
                                margins = margins,owner=owner,
                                 tariffPost = tariff, labels=prodNames)

print(result.logit)           # return predicted price change
summary(result.logit)         # summarize merger simulation



