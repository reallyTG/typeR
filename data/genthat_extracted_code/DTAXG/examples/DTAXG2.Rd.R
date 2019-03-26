library(DTAXG)


### Name: DTAXG2
### Title: Two Diagnostic Tests Assessment in the Absence of Gold Standard
### Aliases: DTAXG2

### ** Examples

group1=c(rep(1,86),rep(0,64))
group2=c(rep(1,27),rep(0,86-27),rep(1,5),rep(0,64-5))
prior.se.group1=c(0.5,0.85)
prior.sp.group1=c(0.8,1)
prior.se.group2=c(0.1,0.5)
prior.sp.group2=c(0.1,0.5)
prior.pi=c(0.66,0.67)

rst=DTAXG2(
  group1,
  group2,
  prior.se.group1,
  prior.sp.group1,
  prior.se.group2,
  prior.sp.group2,
  prior.pi,
  n.sample=120,
  n.burnin=20)

print(rst)




