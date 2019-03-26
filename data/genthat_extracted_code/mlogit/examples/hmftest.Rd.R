library(mlogit)


### Name: hmftest
### Title: Hausman-McFadden Test
### Aliases: hmftest hmftest.formula hmftest.mlogit
### Keywords: htest

### ** Examples


## from Greene's Econometric Analysis p. 731

data("TravelMode",package="AER")
TravelMode <- mlogit.data(TravelMode,choice="choice",shape="long",
                          alt.var="mode",chid.var="individual")

## Create a variable of income only for the air mode

TravelMode$avinc <- with(TravelMode,(mode=='air')*income)

## Estimate the model on all alternatives, with car as the base level
## like in Greene's book.

#x <- mlogit(choice~wait+gcost+avinc,TravelMode,reflevel="car")
x <- mlogit(choice~wait+gcost+avinc,TravelMode)

## Estimate the same model for ground modes only (the variable avinc
## must be dropped because it is 0 for every observation

g <- mlogit(choice~wait+gcost,TravelMode,reflevel="car",
            alt.subset=c("car","bus","train"))

## Compute the test

hmftest(x,g)




