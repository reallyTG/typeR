library(rsm)


### Name: varfcn
### Title: Display the scaled variance function for a design
### Aliases: varfcn
### Keywords: design

### ** Examples

  des = ccd(~ x1 + x2 + x3, alpha = 1.5, block = Phase ~ x1*x2*x3, randomize=FALSE)
  varfcn(des, ~ Phase + SO(x1, x2, x3))
  varfcn(des, ~ Phase + SO(x1, x2, x3), contour=TRUE)
  
  # 10 random directions
  dirs = data.frame(x3=rnorm(10), x2=rnorm(10), x1=rnorm(10))
  varfcn(des, ~ Phase + SO(x1, x2, x3), vectors = dirs)

  # exclude some points to make it more interesting
  lost = c(1,2,3,5,8,13,21)
  varfcn(des[-lost, ], ~ Phase + SO(x1, x2, x3), contour=TRUE)
  
  # different plot due to order of columns
  varfcn(des[-lost, ], ~ Phase + SO(x1, x2, x3), vectors = dirs, contour=TRUE)



