library(migest)


### Name: cm2
### Title: Conditional Maximization Routine for the Indirect Estimation of
###   Origin-Destination Migration Flow Table with Known Margins.
### Aliases: cm2

### ** Examples

## with Willekens (1999) data
dn <- LETTERS[1:2]
y <- cm2(rtot = c(18, 20), ctot = c(16, 22), 
         m = matrix(c(5, 1, 2, 7), ncol = 2, dimnames = list(orig = dn, dest = dn)))
y

## with all elements of offset equal (independence fit)
y <- cm2(rtot = c(18, 20), ctot = c(16, 22))
y

## with bigger matrix
dn <- LETTERS[1:3]
y <- cm2(rtot = c(170, 120, 410), ctot = c(500, 140, 60), 
         m = matrix(c(50, 10, 220, 120, 120, 30, 545, 0, 10), 
                    ncol = 3, 
                    dimnames = list(orig = dn, dest = dn)))
                    
# display with row and col totals
round(addmargins(y$N)) 



