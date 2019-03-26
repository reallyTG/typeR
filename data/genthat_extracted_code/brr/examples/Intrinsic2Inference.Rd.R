library(brr)


### Name: Intrinsic2Inference
### Title: Intrinsic inference on the rates ratio based on the second
###   intrinsic discrepancy.
### Aliases: Intrinsic2Inference intrinsic2_H0 intrinsic2_bounds
###   intrinsic2_estimate intrinsic2_phi0 intrinsic2_phi0_sims

### ** Examples

a<-2; b<-10; c<-1/2; d<-0; S<-100; T<-S; x<-0; y<-20
intrinsic2_phi0(0.5, x, y, S, T, a, b, c, d)
intrinsic2_phi0_sims(0.5, x, y, S, T, a, b, c, d)
intrinsic2_estimate(x, y, S, T, a, b, c, d)
bounds <- intrinsic2_bounds(x, y, S, T, a, b, c, d, conf=0.95); bounds
ppost_phi(bounds[2], a, b, c, d, S, T,  x, y)- ppost_phi(bounds[1], a, b, c, d, S, T, x, y)



