library(SharpeR)


### Name: sropt
### Title: Create an 'sropt' object.
### Aliases: sropt
### Keywords: univar

### ** Examples

# roll your own.
ope <- 253
zeta.s <- 1.0
df1 <- 10
df2 <- 6 * ope
set.seed(as.integer(charToRaw("fix seed")))
rvs <- rsropt(1,df1,df2,zeta.s,ope,drag=0)
roll.own <- sropt(z.s=rvs,df1,df2,drag=0,ope=ope)
print(roll.own)
# put a bunch in. naming becomes a problem.
rvs <- rsropt(5,df1,df2,zeta.s,ope,drag=0)
roll.own <- sropt(z.s=rvs,df1,df2,drag=0,ope=ope)
print(roll.own)



