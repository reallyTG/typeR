library(Aoptbdtvc)


### Name: wtaoptbtib
### Title: Weighted A-optimal balanced treatment incomplete block designs
### Aliases: wtaoptbtib
### Keywords: balanced treatment incomplete block design weighted A-optimal

### ** Examples

##construct a weighted A-optimal BTIB design with 4 test treatments in 6 blocks each of size 4 
##with weights to test vs test treatments comparisons as 0.6
wtaoptbtib(v=4,b=6,k=4,alpha=0.6,rho=0)
##construct an A-optimal BTIB design with 9 test treatments in 12 blocks each of size 4 
##with weights to test vs test treatments comparisons as 0
wtaoptbtib(v=9,b=12,k=4,alpha=0,rho=0)
##design not found
## Not run: wtaoptbtib(v=3,b=6,k=5,alpha=0.2,rho=0)
##BTIB design does not exist for these parameters
#Not run
wtaoptbtib(3,4,3,0.2,0)



