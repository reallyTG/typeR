library(BAMBI)


### Name: circ_cor
### Title: Sample circular correlation coefficients
### Aliases: circ_cor

### ** Examples

# generate data from vmsin model
set.seed(1)
dat <- rvmsin(100, 2,3,-0.8,0,0)

# now calculate circular correlation(s) between the 2 columns of dat
circ_cor(dat, type="js")
circ_cor(dat, type="fl")
circ_cor(dat, type="tau1")
circ_cor(dat, type="tau2")





