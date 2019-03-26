library(StressStrength)


### Name: gkf
### Title: Numerical solution for an equation involving noncentral T cdf
### Aliases: gkf
### Keywords: distribution

### ** Examples

p<-0.95
q<-5
df<-12
ncp<-gkf(p, q, df)
ncp
# check if the result is correct
pt(q, df, ncp)
# OK
# changing the tolerance
ncp<-gkf(p, q, df, eps=1e-10)
ncp
pt(q, df, ncp)



