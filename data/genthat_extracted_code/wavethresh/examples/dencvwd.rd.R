library(wavethresh)


### Name: dencvwd
### Title: Calculate variances of wavlet coefficients of a p.d.f.
### Aliases: dencvwd
### Keywords: smooth

### ** Examples

# Simulate data from the claw density, find the 
# empirical scaling function coefficients and covariances and then decompose
# both to give wavelet coefficients and their variances.

data <- rclaw(100)
datahr <- denproj(data, J=8, filter.number=2,family="DaubExPhase", covar=TRUE)
data.wd <- denwd(datahr)
## Not run: plotdenwd(data.wd, top.level=(datahr$res$J-1))

datavar <- dencvwd(datahr)
## Not run: plotdenwd(datavar, top.level=(datahr$res$J-1)) 



