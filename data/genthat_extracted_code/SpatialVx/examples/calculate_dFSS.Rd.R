library(SpatialVx)


### Name: calculate_dFSS
### Title: Calculate dFSS Score Value
### Aliases: calculate_dFSS

### ** Examples


# ---------------------------------------------
# A simple example with two 500 x 500 fields
# ---------------------------------------------

# generate two empty 500 x 500 fields where all values are 0 
fbin1=matrix(0, 500, 500, byrow = FALSE)
fbin2=fbin1

# in the fields define a single 20x20 non-zero region of precipitation
# that is horizontally displaced in the second field by 100 grid points   
fbin1[200:220,200:220]=1
fbin2[200:220,300:320]=1

# calulate dFSS value
dFSS=calculate_dFSS(fbin1, fbin2)

# print dFSS value 
print(dFSS)

# The example should output 97 which means that the spatial displacement
# estimated by dFSS is 97 grid points.



