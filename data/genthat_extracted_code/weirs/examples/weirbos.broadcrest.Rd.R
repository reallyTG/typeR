library(weirs)


### Name: weirbos.broadcrest
### Title: Compute Open-Channel Flow over Broad-Crested Weir by Bos (1989)
### Aliases: weirbos.broadcrest
### Keywords: misc

### ** Examples


# Simple, scalar inputs and results
weir.broadcrest(type="BOS", 0.5, b=8, B=11, P=6, L=3.25);

# Vector of heads
weir.broadcrest(type="BOS", c(0.5,0.4,0.3), b=8, B=11, P=6, L=3.25);

# Now compare two solutions by weirbos.broadcrest() to weir3a5.broadcrest()
h <- seq(0.01,1.5, by=0.001)
Qtank     <- weir3a5.broadcrest(h, b=7.97, B=10.97, P=1.125, L=3.76, flowdigits=4)
QtankbosA <- weirbos.broadcrest(h, b=7.97, B=10.97, P=1.125, L=3.76, flowdigits=4)
QtankbosB <- weirbos.broadcrest(h, b=7.97, B=10.97, P=1.125, L=3.76,
                                   hhptest=FALSE, flowdigits=4)
plot(Qtank$flow, h, type="l", col=8, lwd=6,
     xlab="FLOW, CFS", ylab="HEAD, FEET")
lines(QtankbosA$flow, h, col=2, lwd=4) # see the trunction in the red line
lines(QtankbosB$flow, h, col=3, lwd=2)

# See examples for weir3a5.broadcrest() for additional examples that
# explore higher complexity of argument settings, which test the
# nomographs for k_c, k_R, and k_s



