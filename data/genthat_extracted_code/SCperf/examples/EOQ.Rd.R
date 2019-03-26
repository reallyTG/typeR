library(SCperf)


### Name: EOQ
### Title: Economic Order Quantity model
### Aliases: EOQ

### ** Examples

 ## Not run: 
##D #Classical EOQ model
##D #Given demand d=8000 items per year; set up cost k=12000; and holding cost h=0.3
##D #per unit we find that the optimal solution is to order 25298 units every 3.2
##D #months with a total variable cost of $7589.5
## End(Not run)
 
EOQ(8000,12000,0.3)

## Not run: 
##D #EOQ model with planned shortages
##D #Consider now that backorders are allowed with a backorder cost b=1.1 per
##D #unit and year. Then the optimal solution is to order 28540 units every 3.6 months.
##D #The total variable cost is $6727.3 and the maximum shortage is 6116 units.
## End(Not run)
   
EOQ(8000,12000,0.3,1.1)





