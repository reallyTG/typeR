library(EconDemand)


### Name: DemandQuantity
### Title: Quantity and General Propeties Given Price
### Aliases: DemandQuantity

### ** Examples

#Set price vector
price<-c(1,1.1,1.2)
#Use Linear Demand Function
X<-DemandQuantity(price,c(10,0.5), "Linear", Plot=TRUE, message=TRUE)
#Return the quantities
X$quantity
#Return the marginal revenues
X$marginal.revenue



