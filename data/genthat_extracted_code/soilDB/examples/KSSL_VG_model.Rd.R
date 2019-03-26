library(soilDB)


### Name: KSSL_VG_model
### Title: Develop a Water Retention Curve from KSSL Data
### Aliases: KSSL_VG_model

### ** Examples

# basic example
d <- data.frame(theta_r=0.0337216, 
theta_s=0.4864061, 
alpha=-1.581517, 
npar=0.1227247)

vg <- KSSL_VG_model(d)

str(vg)



