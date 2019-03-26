library(eel)


### Name: prime_image_est
### Title: Calculating prime-image based on similarity mapping for
###   parameters defined by estimating equations
### Aliases: prime_image_est prime_image_est.default
### Keywords: image EEL

### ** Examples

x=rnorm(50,6,2)
# find the prime image of true mean
prime_image_est(theta_tilda=mean(x),theta=6,x=x,"x-theta")





