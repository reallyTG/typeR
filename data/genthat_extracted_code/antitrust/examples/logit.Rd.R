library(antitrust)


### Name: logit
### Title: (Nested) Logit Demand Calibration and Merger Simulation
### Aliases: logit logit.nests logit.nests.alm logit.cap logit.alm
###   logit.cap.alm

### ** Examples


## Calibration and simulation results from a merger between Budweiser and
## Old Style.
## Source: Epstein/Rubenfeld 2004, pg 80


prodNames <- c("BUD","OLD STYLE","MILLER","MILLER-LITE","OTHER-LITE","OTHER-REG")
ownerPre <-c("BUD","OLD STYLE","MILLER","MILLER","OTHER-LITE","OTHER-REG")
ownerPost <-c("BUD","BUD","MILLER","MILLER","OTHER-LITE","OTHER-REG")
nests <- c("Reg","Reg","Reg","Light","Light","Reg")

price    <- c(.0441,.0328,.0409,.0396,.0387,.0497)
shares   <- c(.066,.172,.253,.187,.099,.223)
margins <- c(.3830,.5515,.5421,.5557,.4453,.3769)

insideSize <- 1000

names(price) <-
    names(shares) <-
    names(margins) <-
    prodNames

result.logit <- logit(price,shares,margins,
                      ownerPre=ownerPre,ownerPost=ownerPost,
                      insideSize = insideSize,
                      labels=prodNames)



print(result.logit)           # return predicted price change
summary(result.logit)         # summarize merger simulation

elast(result.logit,TRUE)      # returns premerger elasticities
elast(result.logit,FALSE)     # returns postmerger elasticities

diversion(result.logit,TRUE)  # return premerger diversion ratios
diversion(result.logit,FALSE) # return postmerger diversion ratios


cmcr(result.logit)            #calculate compensating marginal cost reduction
upp(result.logit)            #calculate Upwards Pricing Pressure Index

CV(result.logit)              #calculate representative agent compensating variation


## Implement the Hypothetical Monopolist Test
## for BUD and OLD STYLE using a 5% SSNIP

HypoMonTest(result.logit,prodIndex=1:2)



## Get a detailed description of the 'Logit' class slots
showClass("Logit")

## Show all methods attached to the 'Logit' Class
showMethods(classes="Logit")

## Show which classes have their own 'elast' method
showMethods("elast")

## Show the method definition for 'elast' and Class 'Logit'
getMethod("elast","Logit")



#
# Logit With capacity Constraints
#


cap     <- c(66,200,300,200,99,300) # BUD and OTHER-LITE are capacity constrained
result.cap <- logit.cap(price,shares,margins,capacitiesPre=cap,
                        insideSize=insideSize,ownerPre=ownerPre,
                        ownerPost=ownerPost,labels=prodNames)
print(result.cap)




