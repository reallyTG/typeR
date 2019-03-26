library(gMCP)


### Name: secondStageTest
### Title: EXPERIMENTAL: Construct a valid level alpha test for the second
###   stage of an adaptive design that is based on a pre-planned graphical
###   MCP
### Aliases: secondStageTest
### Keywords: graphs htest

### ** Examples



## Simple successive graph (Maurer et al. 2011)
## two treatments two hierarchically ordered endpoints
a <- .025
G <- simpleSuccessiveI()
## some z-scores:

p1=c(.1,.12,.21,.16)
z1 <- qnorm(1-p1)
p2=c(.04,1,.14,1)
z2 <- qnorm(1-p2)
v <- c(1/2,1/3,1/2,1/3)

intA <- doInterim(G,z1,v)

## select only the first treatment 
fTest <- secondStageTest(intA,c(1,0,1,0))






