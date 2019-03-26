library(Conake)


### Name: simp_int
### Title: The Simpson method to compute integral
### Aliases: simp_int

### ** Examples

Vec=rgamma(100,1.5,2.6)
x=seq(min(Vec),max(Vec),length.out=100)
simp_int(x,dgamma(x,1.5,2.6))




