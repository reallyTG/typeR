library(SCperf)


### Name: Newsboy
### Title: The newsboy model
### Aliases: Newsboy

### ** Examples

 ## Not run: 
##D # Example Porteus #
##D # Suppose demand is normally distributed with mean 100 and standard
##D # deviation 30. If p = 4 and c = 1, then CR = 0.75 and Q=120.23.
##D # Note that the order is for 20.23  units (safety stock) more than the
##D # mean. Note also that ExpC(120.23) = 38.13 and ExpP(120.23)=261.87,
##D # with FR=0.96.
## End(Not run)

Newsboy(100,30,4,1)

## Not run: 
##D # Example Gallego #
##D # Suppose demand is normal with mean 100 and standard deviation 20. The
##D # unit cost is 5, the holding and penalty cost are 1 and 3
##D # respectively. From the definition of the holding and penalty
##D # cost we find that p=4, then CR = 0.75 and Q = 113.49. Notice that the
##D # order is for 13.49 units (safety stock) more than the mean,
##D # ExpC(113.49) = 25.42 and ExpP(113.49) = 274.58, with fill rate of
##D # 97 percent.
## End(Not run)

Newsboy(100,20,4,1)




