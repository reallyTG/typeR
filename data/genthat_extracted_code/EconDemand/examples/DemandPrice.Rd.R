library(EconDemand)


### Name: DemandPrice
### Title: Price and General Propeties Given Quantity
### Aliases: DemandPrice

### ** Examples

#Set quantity vector
quantity<-c(1,1.1,1.2)
#Use Translog Demand Function
X<-DemandPrice(quantity, c(10,0.5), "Translog", Plot=TRUE, message=TRUE)
#Return the prices
X$price
#Return the demand elasticity
X$elasticity



