library(eel)


### Name: prime_image
### Title: Calculating prime-image based on similarity mapping for the mean
### Aliases: prime_image prime_image.default
### Keywords: mapping image

### ** Examples

x=rnorm(50,6,2)
# find the prime image of true mean
prime_image(theta_tilda=mean(x),theta=6,x=x)



