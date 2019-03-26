library(mxkssd)


### Name: mxkssd
### Title: Efficient mixed-level k-circulant supersaturated designs
### Aliases: mxkssd
### Keywords: supersaturated design mixed-level k-circulant efficiency
###   mxkssd

### ** Examples
##To generate an efficient mixed level 2-circulant supersaturated design 
#with 8 runs and 14 factors such that 7 factors have number of levels 2 and 
#another 7 factors have number of levels 4. So the level_vec is c(2,4). 
#The required minimum efficiency is 1.
mxkssd(14,8,c(2,4),2,1)


