library(imager)


### Name: imager.combine
### Title: Combining images
### Aliases: imager.combine add wsum average mult parmax parmax.abs
###   parmin.abs parmin enorm parmed parvar parsd parall parany equal
###   which.parmax which.parmin parsort parorder parrank

### ** Examples

im1 <- as.cimg(function(x,y) x,50,50)
im2 <- as.cimg(function(x,y) y,50,50)
im3 <- as.cimg(function(x,y) cos(x/10),50,50)
l <- imlist(im1,im2,im3)
add(l) %>% plot #Add the images
average(l) %>% plot #Average the images
mult(l) %>% plot #Multiply
wsum(l,c(.1,8,.1)) %>% plot #Weighted sum
parmax(l) %>% plot #Parallel max
parmin(l) %>% plot #Parallel min
parmed(l) %>% plot #Parallel median
parsd(l) %>% plot #Parallel std. dev
#parsort can also be used to produce parallel max. and min
(parsort(l)[[1]]) %>% plot("Parallel min")
(parsort(l)[[length(l)]]) %>% plot("Parallel max")
#Resize boats so the next examples run faster
im <- imresize(boats,.5)
#Edge detection (Euclidean norm of gradient)
imgradient(im,"xy") %>% enorm %>% plot
#Pseudo-artistic effects
l <- map_il(seq(1,35,5),~ boxblur(im,.))
parmin(l) %>% plot
average(l) %>% plot
mult(l) %>% plot
#At each pixel, which colour channel has the maximum value?
imsplit(im,"c") %>% which.parmax %>% table
#Same thing using parorder (ties are broken differently)!!!
imsplit(im,"c") %>% { parorder(.)[[length(.)]] } %>% table



