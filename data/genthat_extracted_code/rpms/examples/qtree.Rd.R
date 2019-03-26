library(rpms)


### Name: qtree
### Title: qtree
### Aliases: qtree rpms::qtree

### ** Examples

{
# model mean of retirement account value for households with reported 
# retirment account values > 0 using a binary tree while accounting for 
# clusterd data and sample weights.

s1<- which(CE$IRAX > 0)
r1 <-rpms(IRAX~EDUCA+AGE+BLS_URBN, data = CE[s1,],  weights=~FINLWT21, clusters=~CID) 

# get Latex code
qtree(r1)

}



