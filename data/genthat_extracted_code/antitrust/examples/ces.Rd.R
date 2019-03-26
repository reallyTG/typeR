library(antitrust)


### Name: ces
### Title: (Nested) Constant Elasticity of Substitution Demand Calibration
###   and Merger Simulation
### Aliases: ces ces.alm ces.nests

### ** Examples



## Calibration and simulation results from a merger between Budweiser and
## Old Style. Assume that typical consumer spends 1% of income on beer,
## and that total beer expenditure in US is 1e9
## Source: Epstein/Rubenfeld 2004, pg 80

prodNames <- c("BUD","OLD STYLE","MILLER","MILLER-LITE","OTHER-LITE","OTHER-REG")
ownerPre <-c("BUD","OLD STYLE","MILLER","MILLER","OTHER-LITE","OTHER-REG")
ownerPost <-c("BUD","BUD","MILLER","MILLER","OTHER-LITE","OTHER-REG")
nests <- c("R","R","R","L","L","R")

price    <- c(.0441,.0328,.0409,.0396,.0387,.0497)
shares   <- c(.071,.137,.251,.179,.093,.269)
margins  <- c(.3830,.5515,.5421,.5557,.4453,.3769)

names(price) <-
    names(shares) <-
    names(margins) <-
    prodNames

result.ces <-ces(price,shares,margins,ownerPre=ownerPre,ownerPost=ownerPost,
                labels=prodNames)

print(result.ces)           # return predicted price change
summary(result.ces)         # summarize merger simulation

elast(result.ces,TRUE)      # returns premerger elasticities
elast(result.ces,FALSE)     # returns postmerger elasticities

diversion(result.ces,TRUE)  # return premerger diversion ratios
diversion(result.ces,FALSE) # return postmerger diversion ratios

cmcr(result.ces)            #calculate compensating marginal cost reduction
upp(result.ces)             #calculate Upwards Pricing Pressure Index

CV(result.ces)              #calculate compensating variation as a percent of
                            #representative consumer income

## Implement the Hypothetical Monopolist Test
## for BUD and OLD STYLE using a 5% SSNIP

HypoMonTest(result.ces,prodIndex=1:2)


## Get a detailed description of the 'CES' class slots
showClass("CES")

## Show all methods attached to the 'CES' Class
showMethods(classes="CES")

## Show which class have their own 'elast' method
showMethods("elast")

## Show the method definition for 'elast' and Class 'CES'
getMethod("elast","CES")







