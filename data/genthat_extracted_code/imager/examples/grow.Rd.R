library(imager)


### Name: grow
### Title: Grow/shrink a pixel set
### Aliases: grow shrink

### ** Examples

#A pixel set:
a <- grayscale(boats) > .8
plot(a)
#Grow by a 8x8 square
grow(a,8) %>% plot
#Grow by a 8x2 rectangle
grow(a,8,2) %>% plot
#Custom structuring element
el <- matrix(1,2,2) %>% as.cimg
all.equal(grow(a,el),grow(a,2))
#Circular structuring element
px.circle(5) %>% grow(a,.) %>% plot
#Sometimes boundary conditions matter
im <- imfill(10,10)
px <- px.all(im)
shrink(px,3,bound=TRUE) %>% plot(main="Boundary conditions: TRUE")
shrink(px,3,bound=FALSE) %>% plot(main="Boundary conditions: FALSE")



