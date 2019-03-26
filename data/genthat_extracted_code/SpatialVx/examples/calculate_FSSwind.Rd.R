library(SpatialVx)


### Name: calculate_FSSwind
### Title: Calculate FSSwind Score Value
### Aliases: calculate_FSSwind

### ** Examples

# ---------------------------------------------
# A simple example with two 500 x 500 fields
# ---------------------------------------------

# generate two 500 x 500 wind class index fields where all values are 1 (wind class 1)
findex1=matrix(1, 500, 500, byrow = FALSE)
findex2=findex1

# in the fields generate some rectangular areas with other wind classes (classes 2,3 and 4)
findex1[001:220,200:220]=2
findex1[100:220,300:220]=3
findex1[300:500,100:200]=4

findex2[050:220,100:220]=2
findex2[200:320,300:220]=3
findex2[300:500,300:500]=4

# specify a vector of neighborhood sizes for which the FSSwind values are to be calculated
nvector = c(1,51,101,201,301,601,901,1501)

# calulate FSSwind values
FSSwindvector=calculate_FSSwind(findex1, findex2, nvector)

# print FSSwind values 
print(FSSwindvector)

# The example should output:
# 0.6199600 0.6580598 0.7056385 0.8029494 0.8838075 0.9700274 0.9754587 0.9756134



