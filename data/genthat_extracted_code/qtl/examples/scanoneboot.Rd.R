library(qtl)


### Name: scanoneboot
### Title: Bootstrap to get interval estimate of QTL location
### Aliases: scanoneboot
### Keywords: utilities

### ** Examples

data(fake.f2)
fake.f2 <- calc.genoprob(fake.f2, step=1, err=0.001)
## Not run: bootoutput <- scanoneboot(fake.f2, chr=13, method="hk")
## Don't show: 
bootoutput <- scanoneboot(fake.f2, chr=13, method="hk", n.boot=50)
## End(Don't show)

plot(bootoutput)
summary(bootoutput)



