library(antitrust)


### Name: linear
### Title: Linear and Log-Linear Demand Calibration and Merger Simulation
### Aliases: linear loglinear

### ** Examples


## Simulate a merger between two single-product firms in a
## three-firm market with linear demand with diversions
## that are proportional to shares.
## This example assumes that the merger is between
## the first two firms



n <- 3 #number of firms in market
price    <- c(2.9,3.4,2.2)
quantity <- c(650,998,1801)
margin <- c(.435,.417,.370)


#simulate merger between firms 1 and 2
owner.pre <- diag(n)
owner.post <- owner.pre
owner.post[1,2] <- owner.post[2,1] <- 1



result.linear <- linear(price,quantity,margin,ownerPre=owner.pre,ownerPost=owner.post)

print(result.linear)           # return predicted price change
summary(result.linear)         # summarize merger simulation

elast(result.linear,TRUE)      # returns premerger elasticities
elast(result.linear,FALSE)     # returns postmerger elasticities

diversion(result.linear,TRUE)  # returns premerger diversion ratios
diversion(result.linear,FALSE) # returns postmeger diversion ratios

cmcr(result.linear)            # returns the compensating marginal cost reduction

CV(result.linear)              # returns representative agent compensating variation


## Implement the Hypothetical Monopolist Test
## for products 1 and 2 using a 5% SSNIP

#HypoMonTest(result.linear,prodIndex=1:2)


## Get a detailed description of the 'Linear' class slots
showClass("Linear")

## Show all methods attached to the 'Linear' Class
showMethods(classes="Linear")

## Show which class have their own 'elast' method
showMethods("elast")

## Show the method definition for 'elast' and Class 'Linear'
getMethod("elast","Linear")






