library(OmicsPLS)


### Name: o2m
### Title: Perform O2-PLS with two-way orthogonal corrections
### Aliases: o2m

### ** Examples

test_X <- scale(matrix(rnorm(100*10),100,10))
test_Y <- scale(matrix(rnorm(100*11),100,11))
#  --------- Default run ------------ 
o2m(test_X, test_Y, 3, 2, 1)
#  ---------- Stripped version ------------- 
o2m(test_X, test_Y, 3, 2, 1, stripped = TRUE)
#  ---------- High dimensional version ---------- 
o2m(test_X, test_Y, 3, 2, 1, p_thresh = 1)
#  ------ High D and stripped version --------- 
o2m(test_X, test_Y, 3, 2, 1, stripped = TRUE, p_thresh = 1)
#  ------ Now with more iterations -------- 
o2m(test_X, test_Y, 3, 2, 1, stripped = TRUE, p_thresh = 1, max_iterations = 1e6)
#  ---------------------------------- 




