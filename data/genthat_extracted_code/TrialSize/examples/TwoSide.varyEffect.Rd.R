library(TrialSize)


### Name: TwoSide.varyEffect
### Title: Two-Sided Tests with varying effect sizes
### Aliases: TwoSide.varyEffect
### Keywords: ~kwd1 ~kwd2

### ** Examples

delta=c(rep(1,40/2),rep(1/2,40/2));
Example.12.2.4<-TwoSide.varyEffect(s1=100,s2=200,m=4000,m1=40,delta=delta,a1=0.5,r1=24,fdr=0.01)
Example.12.2.4
# n=164 s1<n<s2, h(s1)<0,h(s2)<0




