library(qtl)


### Name: replace.map
### Title: Replace the genetic map of a cross
### Aliases: replace.map replacemap.cross
### Keywords: manip

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
newmap <- est.map(fake.f2)
plotMap(fake.f2, newmap)
fake.f2 <- replace.map(fake.f2, newmap)



