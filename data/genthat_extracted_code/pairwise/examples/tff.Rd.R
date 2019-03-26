library(pairwise)


### Name: tff
### Title: Test information function
### Aliases: tff

### ** Examples

########
data(sim200x3)
result <- pair(sim200x3)
tff(pair_obj = result) # TIF plot 
tff(pair_obj = result, cat=TRUE) # TIF plot 
tff(pair_obj = result, items=c("V1","V3"), cat=TRUE) # TIF plot 
tff(pair_obj = result, x=0) # TIF at theta=0 
tff(pair_obj = result, x=seq(0,4,.1)) # TIF for a given range of Thetas
##### examples with other data ...
data(bfiN)
result <- pair(bfiN)
tff(pair_obj = result)
tff(pair_obj = result, cat=TRUE) # TIF plot 



