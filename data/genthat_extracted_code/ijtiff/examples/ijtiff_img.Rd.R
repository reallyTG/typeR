library(ijtiff)


### Name: ijtiff_img
### Title: 'ijtiff_img' class.
### Aliases: ijtiff_img as_ijtiff_img

### ** Examples

img <- matrix(1:4, nrow = 2)  # to be a single-channel, grayscale image
ijtiff_img(img, description = "single-channel, grayscale")
img <- array(seq_len(2 ^ 3), dim = rep(2, 3))  # 1 channel, 2 frame
ijtiff_img(img, description = "blah blah blah")
img <- array(seq_len(2 ^ 3), dim = c(2, 2, 2, 1))  #  2 channel, 1 frame
ijtiff_img(img, description = "blah blah")
img <- array(seq_len(2 ^ 4), dim = rep(2, 4))  # 2 channel, 2 frame
ijtiff_img(img, software = "R")



