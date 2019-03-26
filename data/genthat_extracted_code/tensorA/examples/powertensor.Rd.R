library(tensorA)


### Name: power.tensor
### Title: Compute the power of a symmetric tensor
### Aliases: power.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(rnorm(120),c(a=2,b=2,c=5,d=3,e=2))
AAt <- A %e% mark(A,"'",c("a","b"))
AAt

power.tensor(AAt,c("a","b"),c("a'","b'"),-1)

inv.tensor(AAt,c("a","b"))

power.tensor(AAt,c("a","b"),c("a'","b'"),2)
mul.tensor(AAt,c("a","b"),AAt,c("a'","b'"))

power.tensor(power.tensor(AAt,c("a","b"),c("a'","b'"),1/pi),
                     c("a","b"),c("a'","b'"),pi)


AAt <- einstein.tensor(A , mark(A,"'",c("a","b")),by="e")

power.tensor(AAt,c("a","b"),c("a'","b'"),-1,by="e")

inv.tensor(AAt,c("a","b"),by="e")

power.tensor(AAt,c("a","b"),c("a'","b'"),2,by="e")
mul.tensor(AAt,c("a","b"),AAt,c("a'","b'"),by="e")

power.tensor(power.tensor(AAt,c("a","b"),c("a'","b'"),1/pi,by="e"),
c("a","b"),c("a'","b'"),pi,by="e")





