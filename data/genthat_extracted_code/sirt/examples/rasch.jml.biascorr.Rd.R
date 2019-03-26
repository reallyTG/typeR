library(sirt)


### Name: rasch.jml.biascorr
### Title: Bias Correction of Item Parameters for Joint Maximum Likelihood
###   Estimation in the Rasch model
### Aliases: rasch.jml.biascorr
### Keywords: Joint maximum likelihood (JML)

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Reading
#############################################################################
data(data.read)
dat <- data( data.read )

# estimate Rasch model
mod <- sirt::rasch.jml( data.read  )

# JML with analytical bias correction
res1 <- sirt::rasch.jml.biascorr( jmlobj=mod  )
print( res1$b.biascorr, digits=3 )
  ##        b.JML b.JMLcorr b.analytcorr1 b.analytcorr2
  ##   1  -2.0086   -1.8412        -1.908        -1.922
  ##   2  -1.1121   -1.0194        -1.078        -1.088
  ##   3  -0.0718   -0.0658        -0.150        -0.127
  ##   4   0.5457    0.5002         0.393         0.431
  ##   5  -0.9504   -0.8712        -0.937        -0.936
  ##  [...]



