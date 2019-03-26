library(migest)


### Name: ipf2
### Title: Iterative Proportional Fitting Routine for the Indirect
###   Estimation of Origin-Destination Migration Flow Table with Known
###   Margins.
### Aliases: ipf2

### ** Examples

## with Willekens (1999) data
dn <- LETTERS[1:2]
y <- ipf2(rtot = c(18, 20), ctot = c(16, 22), 
          m = matrix(c(5, 1, 2, 7), ncol = 2, 
                     dimnames = list(orig = dn, dest = dn)))
round(addmargins(y$mu),2)

## with all elements of offset equal
y <- ipf2(rtot = c(18, 20), ctot = c(16, 22))
round(addmargins(y$mu),2)

## with bigger matrix
dn <- LETTERS[1:3]
y <- ipf2(rtot = c(170, 120, 410), ctot = c(500, 140, 60), 
          m = matrix(c(50, 10, 220, 120, 120, 30, 545, 0, 10), ncol = 3, 
                     dimnames = list(orig = dn, dest = dn)))
# display with row and col totals
round(addmargins(y$mu))

## only one margin known
dn <- LETTERS[1:2]
y <- ipf2(rtot = c(18, 20), ctot = NULL, 
          m = matrix(c(5, 1, 2, 7), ncol = 2, 
                     dimnames = list(orig = dn, dest = dn)))
round(addmargins(y$mu))



