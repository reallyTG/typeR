library(SCperf)


### Name: EPQ
### Title: Economic Production Quantity model
### Aliases: EPQ
### Keywords: Lot models sizing

### ** Examples

 ## Not run: 
##D #Suppose k = 100, h = 5, d = 200, p = 1000. Then the production run at
##D #t=0.1, the optimal order interval is T = 0.5, the optimal order quantity
##D #is Q = 100, the maximum inventory level is I=80 and the total cost is
##D #TC = $400.
## End(Not run)
 
EPQ(d=200,p=1000,k=100,h=5)




