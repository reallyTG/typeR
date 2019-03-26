library(iopsych)


### Name: fuseMat
### Title: The intercorrelation among items and composites made of these
###   items.
### Aliases: fuseMat

### ** Examples

Rxx <- matrix(c(1.00, 0.25,  0.50,  0.61,
                0.25, 1.00,  0.30,  0.10,
                0.50, 0.30,  1.00, -0.30,
                0.61, 0.10, -0.30,  1.00), 4, 4); Rxx

# Single composite
Key <- matrix(c(1, 2, 3, -1), 1, 4); Key

fuseMat(r_mat = Rxx, key_mat = Key)

# Three composites
Key <- matrix(c(1, 2, 3, -1,
                2, 1, 0, -2,
                1, 1, 0,  0), 3, 4, byrow = TRUE)

fuseMat(Rxx, Key)



