library(corTest)


### Name: fisher_transfer_test
### Title: test for equal correlation
### Aliases: fisher_transfer_test
### Keywords: ~kwd1 ~kwd2

### ** Examples

x1=ghdist(n=100,g=0.2,h=0.2)
x0=ghdist(n=100,g=0.2,h=0.2)
z1=x1+ghdist(n=100,g=0.2,h=0.2)
z0=x0+ghdist(n=100,g=0.2,h=0.2)
p=fisher_transfer_test(x1,z1,x0,z0)
print(p)



