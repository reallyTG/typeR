library(frt)


### Name: frt
### Title: Full randomization test
### Aliases: frt
### Keywords: htest design

### ** Examples

# Tomato yield example in Box et al. (2005, 78--80)
data(tomatoes)
attach(tomatoes)
x <- pounds[fertilizer == "A"]
y <- pounds[fertilizer == "B"]
frt(x, y, alt="l")
detach(tomatoes)



