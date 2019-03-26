library(neurobase)


### Name: check_mask_fail
### Title: Check Mask is Binary, Fail otherwise
### Aliases: check_mask_fail

### ** Examples

arr = array(rbinom(1000, size = 1, prob = 0.2), dim = c(10,10,10))
nim = oro.nifti::nifti(arr)
check_mask_fail(nim)



