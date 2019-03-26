library(marked)


### Name: skagit
### Title: An example of the Mulstistrata (multi-state) model in which
###   states are routes taken by migrating fish.
### Aliases: skagit
### Keywords: datasets

### ** Examples

# There are just two states which correspond to route A and route B. There are 6 occasions
# which are the locations rather than times. After release at 1=A there is no movement 
# between states for the first segment, fish are migrating downriver together and all pass 2A. 
# Then after occasion 2, migrants go down the North Fork (3A) or the South Fork (3B), 
# which both empty into Skagit Bay. Once in saltwater, they can go north to Deception Pass (4A)
# or South to a receiver array exiting South Skagit Bay (4B). Fish in route A can then only go
# to the Strait of Juan de Fuca, while fish in route B must pass by Admiralty Inlet (5B). 
# Then both routes end with the array at the Strait of Juan de Fuca.
#
#       1A
#        |
#        2A
#      /     \
#    3A        3B
#   /  \      /  \ 
# 4A   4B    4A  4B       
#  |     \    /   |
#   5A    5B  5A   5B
#      \   \   /    /
#            6
# 
# from 3A and 3B they can branch to either 4A or 4B; branches merge at 6  
# 5A does not exist so p=0; only survival from 4A to 6 can be 
# estimated which is done by setting survival from 4A to 5A to 1 and
# estimating survival from 5A to 6 which is then total survival from 4A to 6.

# See help for mscjs for an example that explains difference between marked and RMark
# with regard to treatment of mlogit parameters like Psi.



