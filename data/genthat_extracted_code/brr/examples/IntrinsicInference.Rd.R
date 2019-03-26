library(brr)


### Name: IntrinsicInference
### Title: Intrinsic inference on the rate ratio.
### Aliases: IntrinsicInference intrinsic_H0 intrinsic_bounds
###   intrinsic_estimate intrinsic_phi0 intrinsic_phi0_sims

### ** Examples

a<-0.5; b<-0; c<-1/2; d<-0; S<-100; T<-S; x<-0; y<-20
intrinsic_phi0(0.5, x, y, S, T, a, b, c, d)
intrinsic_phi0_sims(0.5, x, y, S, T, a, b, c, d)
intrinsic_estimate(x, y, S, T, a, b, c, d)
bounds <- intrinsic_bounds(x, y, S, T, a, b, c, d, conf=0.95); bounds
ppost_phi(bounds[2], a, b, c, d, S, T,  x, y)- ppost_phi(bounds[1], a, b, c, d, S, T, x, y)



