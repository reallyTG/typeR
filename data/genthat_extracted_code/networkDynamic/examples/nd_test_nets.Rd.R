library(networkDynamic)


### Name: nd_test_nets
### Title: networkDynamic testing networks
### Aliases: nd_test_nets
### Keywords: datasets

### ** Examples


data(nd_test_nets)
# print the list of test cases
names(nd_test_nets)
# check that network.size.active works
# (or at least doesn't fail)
# for many types of networks
lapply(nd_test_nets,network.size.active,at=1)




