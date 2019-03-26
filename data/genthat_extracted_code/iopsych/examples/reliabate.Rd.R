library(iopsych)


### Name: reliabate
### Title: Disattenuate a correlation matrix using an estimate of the
###   component reliabilities
### Aliases: reliabate

### ** Examples

r_mat <- matrix(c(1.00, 0.25, 0.30, 
                  0.25, 1.00, 0.50, 
                  0.30, 0.50, 1.00), 3, 3)
rel   <- c(.70, .64, .81)
reliabate(r_mat = r_mat, rel_vec = rel)



