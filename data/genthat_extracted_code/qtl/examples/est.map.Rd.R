library(qtl)


### Name: est.map
### Title: Estimate genetic maps
### Aliases: est.map
### Keywords: utilities

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2,chr=18:19)
## End(Don't show)
newmap <- est.map(fake.f2)
logliks <- sapply(newmap, attr, "loglik")
plotMap(fake.f2, newmap)
fake.f2 <- replace.map(fake.f2, newmap)



