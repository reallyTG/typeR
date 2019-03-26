library(antitrust)


### Name: auction2nd.logit
### Title: 2nd Score Procurement Auction Model
### Aliases: auction2nd.logit auction2nd.logit.alm

### ** Examples


## Calibration and simulation results from a merger between firms 2 and 3 
## of a 4-firm market
## Source: Miller 2014 backup materials http://www.nathanhmiller.org/research

share = c(0.29,0.40,0.28,0.03)

price = c(35.53,  154, 84.08, 53.16)
cost  =  c(NA, 101, NA, NA)

ownerPre <- ownerPost <- diag(length(share))

#Suppose products 2 and 3 merge
ownerPost[2,3] <- ownerPost[3,2] <- 1 

margin = price - cost

result <- auction2nd.logit(price,share,margin,
ownerPre=ownerPre,ownerPost=ownerPost,normIndex=2)


print(result)
summary(result,revenue=FALSE)

##re-run without any price information except Firm 2

price <- rep(NA_real_, length(price))

result.noprice <- auction2nd.logit(price,share,margin,
ownerPre=ownerPre,ownerPost=ownerPost,normIndex=2)

print(result.noprice)
summary(result.noprice,revenue=FALSE)

## Get a detailed description of the 'Auction2ndLogit' class slots
showClass("Auction2ndLogit")

## Show all methods attached to the 'Auction2ndLogit' Class
showMethods(classes="Auction2ndLogit")




