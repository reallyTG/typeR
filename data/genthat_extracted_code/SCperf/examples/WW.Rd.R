library(SCperf)


### Name: WW
### Title: The Wagner-Whitin algorithm
### Aliases: WW

### ** Examples

 ## Not run: 
##D # Example from Hiller, p.952, reproduced bellow:
##D # An airplane manufacturer specializes in producing small airplanes. It has just received
##D # an order from a major corporation for 10 customized executive jet airplanes for the use of
##D # the corporation's upper management. The order calls for three of the airplanes to be delivered
##D # (and paid for) during the upcoming winter months (period 1), two more to be delivered during
##D # the spring (period 2), three more during the summer (period 3), and the final two during the fall
##D # (period 4). Setting up the production facilities to meet the corporation's specifications for
##D # these airplanes requires a setup cost of $2 million.
##D # The manufacturer has the capacity to produce all 10 airplanes within a couple of months, when the
##D # winter season will be under way. However, this would necessitate holding seven of the airplanes in
##D # inventory, at a cost of $200,000 per airplane per period, until their scheduled delivery times
##D # (...) Management would like to determine theleast costly production schedule for filling
##D # this order.
## End(Not run)


x  <- c(3,2,3,2)
a  <- 2
h  <- 0.2
WW(x,a,h,method="backward")

 ## Not run: 
##D # The total variable cost is $4.8 million (minimum value in the first raw). Since we have two
##D # minimun values in the first raw (positions 2 and 4), we have the following solutions:
##D # Solution 1:  Produce to cover demand until period 2, 5 airplanes. In period 3, new decision,
##D # minimun value 2.4 in period 4 (third raw). Then in period 3 produce to cover demand until 
##D # period 4, 5 airplanes.
##D # Solution 2: Produce to cover demand until period 4, 10 airplanes.
## End(Not run)
 
WW(x,a,h,method="forward")

 ## Not run: 
##D #The total variable cost is $4.8 million (minimum value in the last raw). Since we have two minimun
##D # values in columns 1 and 3, the solutions are:
##D # Solution 1: Produce in period 1 to cover demand until period 4, 10 airplanes.
##D # Solution 2: Produce in period 3 to cover demand until period 4, 5 airplanes.In period 2, new
##D # decision, minimun value 2.4 in raw 3. Then in period 1 produce to cover demand until
##D # period 2, 5 airplanes.
## End(Not run)




