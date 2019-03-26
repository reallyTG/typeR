library(kexpmv)


### Name: crs2mat
### Title: Convert a CRS-formatted matrix to standard square format
### Aliases: crs2mat

### ** Examples

# Create a CRS format matrix
ia = c(1, 2, 4, 6)
ja = c(1, 1, 2, 1, 2)
a  = c(-0.071207,  0.065573, -0.041206,  0.005634,  0.041206)
crsmat=list(ia, ja, a)

# Convert CRS format matrix to square format
n = 3
mat = crs2mat(crsmat, n)
print(mat)




