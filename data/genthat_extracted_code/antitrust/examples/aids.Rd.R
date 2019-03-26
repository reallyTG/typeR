library(antitrust)


### Name: aids
### Title: (Nested) AIDS Calibration and Merger Simulation
### Aliases: aids pcaids pcaids.nests

### ** Examples


## Simulate a merger between two single-product firms A and B in a
## three-firm market (A, B, C). This example assumes that the merger is between
## the firms A and B and that A's own-price elasticity is
## known.
## Source: Epstein and Rubinfeld (2004), pg 9, Table 2.


prices    <- c(2.9,3.4,2.2) ## optional for aids, unnecessary for pcaids
shares    <- c(.2,.3,.5)


## The following are used by aids but not pcaids
## only two of the margins are required to calibrate the demand parameters
margins <- c(0.33, 0.36, 0.44)

## The following are used by pcaids, but not aids
knownElast<- -3
mktElast  <- -1


## Define ownership using a vector of firm identities
ownerPre <- c("A","B","C")
ownerPost <- c("A","A","C")

## Alternatively, ownership could be defined using matrices
#ownerPre=diag(1,length(shares))
#ownerPost=ownerPre
#ownerPost[1,2] <- ownerPost[2,1] <- 1


## AIDS: the following assumes both prices and margins are known.
##       Prices are not needed to estimate price changes



result.aids <- aids(shares,margins,prices,ownerPre=ownerPre,ownerPost=ownerPost,labels=ownerPre)



print(result.aids)           # return predicted price change
summary(result.aids)         # summarize merger simulation

elast(result.aids,TRUE)      # returns premerger elasticities
elast(result.aids,FALSE)     # returns postmerger elasticities

diversion(result.aids,TRUE)  # return premerger diversion ratios
diversion(result.aids,FALSE) # return postmerger diversion ratios


cmcr(result.aids)            #calculate compensating marginal cost reduction
upp(result.aids)             #calculate Upwards Pricing Pressure Index


## Implement the Hypothetical Monopolist Test
## for products A and B using a 5% SSNIP

HypoMonTest(result.aids,prodIndex=1:2)


CV(result.aids)        #calculate compensating variation as a percent of
                       #total expenditure
                       #CV can only be calculated if prices are supplied


## Get a detailed description of the 'AIDS' class slots
showClass("AIDS")

## Show all methods attached to the 'AIDS' Class
showMethods(classes="AIDS")

## Show which class have their own 'elast' method
showMethods("elast")

## Show the method definition for 'elast' and Class 'AIDS'
getMethod("elast","AIDS")



## PCAIDS: the following assumes that only one product's elasticity is
##       known as well as the market elasticity.



result.pcaids <- pcaids(shares,knownElast,mktElast,
                        ownerPre=ownerPre,ownerPost=ownerPost,
                        labels=ownerPre)

print(result.pcaids)           # return predicted price change
summary(result.pcaids)         # summarize merger simulation

elast(result.pcaids,TRUE)      # returns premerger elasticities
elast(result.pcaids,FALSE)     # returns postmerger elasticities

diversion(result.pcaids,TRUE)  # return premerger diversion ratios
diversion(result.pcaids,FALSE) # return postmerger diversion ratios


cmcr(result.pcaids)            #calculate compensating marginal cost reduction


## Implement the Hypothetical Monopolist Test
## for products A and B using a 5% SSNIP

HypoMonTest(result.pcaids,prodIndex=1:2)



## Nested PCAIDS: in addition to the PCAIDS information requirements,
##                users must supply the nesting structure as well as margin infromation.

nests <- c('H','L','L') # product A assigned to nest H, products B and C assigned to nest L


result.pcaids.nests <- pcaids.nests(shares,knownElast,mktElast,margins=margins,
                                    nests=nests,ownerPre=ownerPre,
                                    ownerPost=ownerPost,labels=ownerPre)







