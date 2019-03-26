library(qtl)


### Name: plot.scanoneboot
### Title: Plot results of bootstrap for QTL position
### Aliases: plot.scanoneboot
### Keywords: hplot

### ** Examples

data(fake.f2)
fake.f2 <- calc.genoprob(fake.f2, step=1)

## Not run: out.boot <- scanoneboot(fake.f2, chr=13, method="hk")
## Don't show: 
out.boot <- scanoneboot(fake.f2, chr=13, method="hk", n.boot=50)
## End(Don't show)

summary(out.boot)
plot(out.boot)



