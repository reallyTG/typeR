library(migest)


### Name: cm3
### Title: Conditional Maximization Routine for the Indirect Estimation of
###   Origin-Destination-Migrant Type Migration Flow Tables with Known
###   Origin and Destination Margins.
### Aliases: cm3

### ** Examples

## over two tables
dn <- LETTERS[1:2]
y <- cm3(rtot = c(18, 20) * 2, ctot = c(16, 22) * 2, 
         m = array(c(5, 1, 2, 7, 4, 2, 5, 9), dim = c(2, 2, 2), 
                   dimnames = list(orig = dn, dest = dn, type = c("ILL", "HEALTHY"))))
# display with row, col and table totals
y

## over three tables
y <- cm3(rtot = c(170, 120, 410), ctot = c(500, 140, 60), 
         m = array(c(5, 1, 2, 7, 4, 2, 5, 9, 5, 4, 3, 1), dim = c(2, 2, 3), 
                   dimnames = list(orig = dn, dest = dn, type = c("0--15", "15-60", ">60"))),
         verbose = FALSE)
# display with row, col and table totals
y



