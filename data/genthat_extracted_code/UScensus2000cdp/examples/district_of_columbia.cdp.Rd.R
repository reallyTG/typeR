library(UScensus2000cdp)


### Name: district_of_columbia.cdp
### Title: district_of_columbia.cdp
### Aliases: district_of_columbia.cdp
### Keywords: datasets

### ** Examples

data(district_of_columbia.cdp)

plot(district_of_columbia.cdp,col="yellow")
#text(coordinates(district_of_columbia.cdp),district_of_columbia.cdp$name,cex=.3)
title(main="Census Designated Places \n of District_of_columbia, 2000", sub="Quantiles (equal frequency)")
legend("bottomright",legend=district_of_columbia.cdp$pop2000,fill="yellow",bty="o",title="Population Count",bg="white")



