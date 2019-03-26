library(mistr)


### Name: sudo_support
### Title: Support Interval of Distribution Object
### Aliases: sudo_support sudo_support.discrdist sudo_support.contdist
###   sudo_support.mixdist sudo_support.compdist
###   sudo_support.trans_univdist

### ** Examples

B  <- binomdist(10, 0.3)
sudo_support(B)

B2 <- -3*log(B)
sudo_support(B2)

sudo_support( mixdist(B2, normdist(), weights = c(0.5, 0.5)))



