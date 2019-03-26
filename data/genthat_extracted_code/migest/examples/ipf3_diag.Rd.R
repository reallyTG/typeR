library(migest)


### Name: ipf3_diag
### Title: Iterative Proportional Fitting Routine for the Indirect
###   Estimation of Origin-Destination-Migrant Type Migration Flow Tables
###   with Known Origin and Destination Margins and Diagonal Elements.
### Aliases: ipf3_diag

### ** Examples

## create row-table and column-table specific known margins.
dn <- LETTERS[1:4]
P1 <- matrix(c(1000, 100,  10,   0, 
               55,   555,  50,   5, 
               80,    40, 800 , 40, 
               20,    25,  20, 200), 
             nrow = 4, ncol = 4, byrow = TRUE, 
             dimnames = list(pob = dn, por = dn))
P2 <- matrix(c(950, 100,  60,   0, 
                80, 505,  75,   5, 
                90,  30, 800,  40, 
                40,  45,   0, 180), 
             nrow = 4, ncol = 4, byrow = TRUE, 
             dimnames = list(pob = dn, por = dn))
# display with row and col totals
addmargins(P1)
addmargins(P2)

# run ipf

## with alternative offset term
dis <- array(c(1, 2, 3, 4, 2, 1, 5, 6, 3, 4, 1, 7, 4, 6, 7, 1), c(4, 4, 4))
y <- ipf3_diag(rtot = t(P1), ctot = P2, m = dis)
# display with row, col and table totals
round(addmargins(y$mu), 1)
# origin-destination flow table
round(od_sum(y$mu), 1) 



