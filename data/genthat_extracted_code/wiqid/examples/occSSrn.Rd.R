library(wiqid)


### Name: Royle-Nichols occupancy model
### Title: Royle-Nichols model for single-season occupancy estimation
### Aliases: occSSrn occSSrn0 occSSrnSite

### ** Examples

# The weta data from MacKenzie et al (2006) p116:
data(weta)
DH <- weta[, 1:5]
occSS(DH) # for comparison
occSSrn(DH)
y <- rowSums(DH, na.rm=TRUE)
n <- rowSums(!is.na(DH))
occSSrnSite(y, n, lambda ~ Browsed, data=weta)




