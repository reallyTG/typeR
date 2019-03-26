library(imager)


### Name: flatten.alpha
### Title: Flatten alpha channel
### Aliases: flatten.alpha

### ** Examples

#Add alpha channel
alpha <- Xc(grayscale(boats))/width(boats)
boats.a <- imlist(boats,alpha) %>% imappend("c")
flatten.alpha(boats.a) %>% plot
flatten.alpha(boats.a,"darkgreen") %>% plot



