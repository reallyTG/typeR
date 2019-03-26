library(rpms)


### Name: in_node
### Title: in_node
### Aliases: in_node rpms::in_node

### ** Examples

{
# model mean of retirement account value for households with reported 
# retirment account values > 0 using a binary tree while accounting for 
# clusterd data and sample weights.

s1<- which(CE$IRAX > 0)
r1 <-rpms(IRAX~EDUCA+AGE+BLS_URBN, data = CE[s1,],  weights=~FINLWT21, clusters=~CID) 

# Get summary statistics of CUTENURE for households in end-nodes 7 and 8 of the tree

if(7 %in% end_nodes(r1)) 
  summary(CE$CUTENURE[in_node(node=7, r1, data=CE[s1,])])
if(8 %in% end_nodes(r1)) 
  summary(CE$CUTENURE[in_node(node=8, r1, data=CE[s1,])])
}




