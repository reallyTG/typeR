library(DAKS)


### Name: z_test
### Title: One- and Two-Sample Z-Tests for diff Values
### Aliases: z_test
### Keywords: htest manip math models multivariate univar utilities

### ** Examples

sel_set<-ind_gen(ob_counter(pisa[, 1:3]))
z_test(pisa[, 1:3], sel_set[[2]], sel_set[[3]], v = 1)



