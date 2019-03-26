library(migest)


### Name: od_sum
### Title: Extract a Classic Origin-Destination Migration Flow Matrix.
### Aliases: od_sum

### ** Examples

dn <- LETTERS[1:2]
y <- cm3(rtot = c(18, 20) * 2, ctot = c(16, 22) * 2, 
         m = array(c(5, 1, 2, 7, 4, 2, 5, 9), dim = c(2, 2, 2), 
                   dimnames = list(orig = dn, dest = dn, type = c("ILL", "HEALTHY"))))
round(addmargins(y$N))
round(addmargins(od_sum(y$N))) 



