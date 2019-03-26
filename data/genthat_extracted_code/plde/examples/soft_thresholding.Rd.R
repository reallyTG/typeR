library(plde)


### Name: soft_thresholding
### Title: Soft thresholding operator
### Aliases: soft_thresholding

### ** Examples

# clean up
rm(list = ls())
library(plde)
# soft thresholding operater
soft_thresholding(3, 1)
soft_thresholding(-3, 1)
# if the threshold value is large enough, it shrinks to zero
soft_thresholding(-3, 4)
soft_thresholding(3, 4)
# Plot of the soft thresholding operater
y = seq(-3, 3, length = 100)
st = NULL
for (i in 1 : length(y))
   st[i] = soft_thresholding(y[i], 1)
plot(y, y, col = "gray", type = "l", ylab = "ST")
lines(y, st, col = "blue")



