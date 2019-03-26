library(emuR)


### Name: dct
### Title: Discrete Cosine Transformation
### Aliases: dct
### Keywords: math

### ** Examples


data(vowlax)
# obtain the first four DCT coefficients 
# (frequencies k = 0, 1, 2, 3) for some 
# first formant frequency data
vec <- vowlax.fdat[1,1]$data
dct(vec, m=4)

# obtain the corresponding smoothed
# trajectory
dct(vec, m=4 , fit=TRUE)




