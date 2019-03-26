library(rpms)


### Name: node_plot
### Title: node_plot
### Aliases: node_plot rpms::node_plot

### ** Examples

{

# model mean of retirement account value for households with reported 
# retirment account values > 0 using a binary tree while accounting for 
# clusterd data and sample weights.

s1<- which(CE$IRAX > 0)
r1 <-rpms(IRAX~EDUCA+AGE+BLS_URBN, data = CE[s1,],  weights=~FINLWT21, clusters=~CID) 

# plot node 6 if it is an end-node of the tree
if(6 %in% end_nodes(r1))
  node_plot(t1=r1, node=6, data=CE[s1,])

# plot node 6 if it is an end-node of the tree
if(8 %in% end_nodes(r1))
  node_plot(t1=r1, node=8, data=CE[s1,])

}




