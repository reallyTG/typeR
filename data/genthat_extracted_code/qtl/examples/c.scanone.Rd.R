library(qtl)


### Name: c.scanone
### Title: Combine columns from multiple scanone results
### Aliases: c.scanone cbind.scanone
### Keywords: manip

### ** Examples

data(fake.f2)
fake.f2 <- calc.genoprob(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
out.hk <- scanone(fake.f2, method="hk")
out.np <- scanone(fake.f2, model="np")

out <- c(out.hk, out.np, labels=c("hk","np"))
plot(out, lod=1:2, col=c("blue", "red"))



