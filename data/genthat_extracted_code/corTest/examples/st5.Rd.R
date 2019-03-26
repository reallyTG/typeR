library(corTest)


### Name: st5
### Title: install
### Aliases: st5
### Keywords: ~kwd1 ~kwd2

### ** Examples

x1=ghdist(n=100,g=0.2,h=0.2)
x0=ghdist(n=100,g=0.2,h=0.2)
z1=x1+ghdist(n=100,g=0.2,h=0.2)
z0=x0+ghdist(n=100,g=0.2,h=0.2)
p=st5(x1,z1,x0,z0)
print(p)



