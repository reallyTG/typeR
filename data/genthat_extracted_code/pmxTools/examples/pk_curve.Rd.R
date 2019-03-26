library(pmxTools)


### Name: pk_curve
### Title: Provide concentration-time curves.
### Aliases: pk_curve

### ** Examples

plot(pk_curve(t=seq(0,72,by=0.1), model="3cmt_oral", ii=12, addl=5,
  params=list(CL=2.5, V1=25, V2=2, V3=5, Q2=0.5, Q3=0.25, ka=1)), type="l")



