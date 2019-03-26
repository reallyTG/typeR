library(SpatialVx)


### Name: calculate_FSSvector_from_binary_fields
### Title: Calculate FSS Values
### Aliases: calculate_FSSvector_from_binary_fields

### ** Examples


# ---------------------------------------------
# A simple example with two 500 x 500 fields
# ---------------------------------------------

# generate two empty 500 x 500 binary fields where all values are 0 
fbin1=matrix(0, 500, 500, byrow = FALSE)
fbin2=fbin1

# in the fields define a single 20x20 non-zero region of precipitation that
# is horizontally displaced in the second field by 100 grid points 
fbin1[200:220,200:220]=1
fbin2[200:220,300:320]=1

# specify a vector of neighborhood sizes for which the FSS values are to be calculated
nvector = c(1,51,101,201,301,601,901,1501)

# calulate FSS values
FSSvector=calculate_FSSvector_from_binary_fields(fbin1, fbin2, nvector)

# print FSS values 
print(FSSvector)

# The example should output:
#  0.00000000 0.00000000 0.04271484 0.52057596 0.68363656 0.99432823 1.00000000 1.00000000



