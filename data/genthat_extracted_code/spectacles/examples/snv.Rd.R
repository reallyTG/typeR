library(spectacles)


### Name: snv
### Title: Standard and Robust Normal Variate transformations
### Aliases: snv rnv rnv

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Standard Normal Variate transform
s <- apply_spectra(australia[1:10,], snv)
plot(s)

# The scale function in the base package is actually doing
# the same thing!
s <- apply_spectra(australia[1:10,], scale, center = TRUE, scale = TRUE)
plot(s)

# Robust Normal Variate transform
s <- apply_spectra(australia[1:10,], rnv, r = 0.25)
plot(s)




