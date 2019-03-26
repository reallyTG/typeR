library(ggtern)


### Name: rgb2hex
### Title: Convert RGB to HEX Color
### Aliases: rgb2hex
### Keywords: internal

### ** Examples

#Black
rgb2hex(0,0,0)

#White
rgb2hex(255,255,255)

#Red
rgb2hex(255,0,0)

#Green
rgb2hex(0,255,0) 

#Blue
rgb2hex(0,0,255)

#Vectorised sequence of blue
rgb2hex(0,0,seq(0,255,by=5))



