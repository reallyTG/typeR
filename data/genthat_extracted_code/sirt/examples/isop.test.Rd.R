library(sirt)


### Name: isop.test
### Title: Testing the ISOP Model
### Aliases: isop.test summary.isop.test
### Keywords: ISOP model summary Nonparametric IRT

### ** Examples

#############################################################################
# EXAMPLE 1: ISOP model data.Students
#############################################################################

data(data.Students, package="CDM")
dat <- data.Students[, paste0("act",1:5) ]
dat <- dat[1:300, ]    # select first 300 students

# perform the ISOP test
mod <- sirt::isop.test(dat)
summary(mod)
  ## -> W1i statistics
  ##     parm   N     M   est    se      t
  ##   1 test 300    NA 0.430 0.036 11.869
  ##   2 act1 278 0.601 0.451 0.048  9.384
  ##   3 act2 275 0.473 0.473 0.035 13.571
  ##   4 act3 274 0.277 0.352 0.098  3.596
  ##   5 act4 291 1.320 0.381 0.054  7.103
  ##   6 act5 276 0.460 0.475 0.042 11.184



