library(spc4sts)


### Name: bp
### Title: Box-Pierce-Type Statistic
### Aliases: bp bp2

### ** Examples

img <- matrix(rnorm(100),10,10)

## for pixels with the boundary problem, e.g., Pixel (5,1),
# running bp2(img,5,1,3) will produce an error; instead, use bp() in this case:
bp(img,5,1,3)

## for pixels without the boundary problem, e.g., Pixel (5,5),
# both can be used, but bp2() is more efficient than bp()
bp2(img,5,5,3)
bp(img,5,5,3)



