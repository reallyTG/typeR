library(antitrust)


### Name: auction2nd.cap
### Title: (Capacity Constrained) 2nd Price Auction Model
### Aliases: auction2nd.cap

### ** Examples

##Suppose there are 3 firms (A,B,C) participating in a procurement auction with
## an unknown reservation price and that firm A acquires firm B.

caps <- c(0.65,0.30,0.05)           # total capacity normalized to 1 in this example
inShare    <- .67                   # probability that buyer does not select
                                    # any bidder
prices     <- c(3.89, 3.79, 3.74)   # average price charged by each firm
margins    <- c(.228, .209, 0.197)  # average margin earned by each firm
ownerPre   <- ownerPost   <-c("A","B","C")
ownerPost[ownerPost=="B"] <- "A"

##assume costs are uniformly distributed with unknown bounds
result.unif = auction2nd.cap(
          capacities=caps,
          margins=margins,prices=prices,reserve=NA,
          shareInside=inShare,
          sellerCostCDF="punif",
          ownerPre=ownerPre,ownerPost=ownerPost,
          labels=ownerPre
          )

print(result.unif)
summary(result.unif)

## Get a detailed description of the 'Auction2ndCap' class slots
showClass("Auction2ndCap")

## Show all methods attached to the 'Auction2ndCap' Class
showMethods(classes="Auction2ndCap")





