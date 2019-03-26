library(qtl)


### Name: replacemap.scanone
### Title: Replace the genetic map in QTL mapping results with an alternate
###   map
### Aliases: replacemap.scanone
### Keywords: manip

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
origmap <- pull.map(fake.f2)
newmap <- est.map(fake.f2)
fake.f2 <- replacemap(fake.f2, newmap)
fake.f2 <- calc.genoprob(fake.f2, step=2.5)
out <- scanone(fake.f2, method="hk")
out.rev <- replacemap(out, origmap)



